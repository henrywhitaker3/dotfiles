#!/bin/bash

# Create a branch containing every open Renovate pull request for this repo.
# Conflicts are resolved in favour of the incoming Renovate change so the
# result can be inspected, adjusted, and pushed as one update.

set -euo pipefail

usage() {
	printf 'Usage: %s [branch-name]\n' "${0##*/}" >&2
	printf 'Default branch name: renovate/bulk-YYYYmmdd-HHMMSS\n' >&2
}

die() {
	printf 'Error: %s\n' "$*" >&2
	exit 1
}

if [[ $# -gt 1 ]]; then
	usage
	exit 2
fi

command -v git >/dev/null 2>&1 || die 'git is required'
command -v gh >/dev/null 2>&1 || die 'the GitHub CLI (gh) is required'

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || die 'run this from a Git repository'
[[ -z "$(git status --porcelain)" ]] || die 'working tree is not clean; commit or stash changes first'
if git rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
	die 'a merge is already in progress'
fi
git remote get-url origin >/dev/null 2>&1 || die 'the repository needs an origin remote'

default_branch="$(gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name')" || die 'could not determine the GitHub default branch'
[[ -n "$default_branch" && "$default_branch" != 'null' ]] || die 'GitHub did not report a default branch'

branch_name="${1:-renovate/bulk-$(date +%Y%m%d-%H%M%S)}"
git check-ref-format --branch "$branch_name" >/dev/null 2>&1 || die "invalid branch name: $branch_name"
if git show-ref --verify --quiet "refs/heads/$branch_name"; then
	die "local branch already exists: $branch_name"
fi

printf 'Fetching the latest origin/%s...\n' "$default_branch"
git fetch --prune origin "refs/heads/$default_branch:refs/remotes/origin/$default_branch"

printf 'Creating %s from origin/%s...\n' "$branch_name" "$default_branch"
git checkout --no-track -b "$branch_name" "origin/$default_branch"

prs="$(gh pr list --state open --limit 1000 --json number,headRefName --jq 'sort_by(.number)[] | select(.headRefName | startswith("renovate/")) | [.number, .headRefName] | @tsv')" || die 'could not list pull requests'

if [[ -z "$prs" ]]; then
	printf 'No open Renovate pull requests found. Branch %s is ready.\n' "$branch_name"
	exit 0
fi

merged=0
skipped=0
while IFS=$'\t' read -r number head_ref; do
	[[ -n "$number" ]] || continue
	printf '\nMerging PR #%s (%s)...\n' "$number" "$head_ref"

	# Fetching the pull-request ref works for PRs from forks as well as branches
	# in origin. FETCH_HEAD is consumed immediately by the merge below.
	if ! git fetch --no-tags origin "refs/pull/$number/head"; then
		printf 'Could not fetch PR #%s; skipping it.\n' "$number" >&2
		skipped=$((skipped + 1))
		continue
	fi

	# The ort strategy resolves many dependency-file conflicts itself. -X theirs
	# makes overlapping hunks prefer the Renovate PR; any remaining unmerged
	# paths are handled below with the same policy.
	if git merge --no-commit --no-ff -X theirs FETCH_HEAD; then
		if git rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
			git commit --no-edit
		fi
		merged=$((merged + 1))
		continue
	fi

	if ! git rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
		die "merge of PR #$number failed before a conflict state; branch left at $branch_name"
	fi

	printf 'Resolving remaining conflicts in favour of PR #%s...\n' "$number"
	while IFS= read -r -d '' path; do
		# A stage-3 entry is the incoming PR version. If it is absent, the PR
		# deleted this path, so preserve that deletion.
		if git cat-file -e ":3:$path" 2>/dev/null; then
			git checkout --theirs -- "$path"
			git add -- "$path"
		else
			git rm -- "$path"
		fi
	done < <(git diff --name-only -z --diff-filter=U)

	[[ -z "$(git ls-files --unmerged)" ]] || die "could not resolve all conflicts for PR #$number; resolve and commit manually"
	git add -A
	git commit --no-edit
	merged=$((merged + 1))
done <<< "$prs"

if (( skipped > 0 )); then
	printf '\nMerged %d Renovate pull request(s) into %s, but %d pull request(s) could not be fetched.\n' "$merged" "$branch_name" "$skipped" >&2
	exit 1
fi

printf '\nMerged %d Renovate pull request(s) into %s. Review, then push with:\n' "$merged" "$branch_name"
printf '  git push --set-upstream origin %s\n' "$branch_name"
