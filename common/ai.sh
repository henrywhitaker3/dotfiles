#!/bin/bash

runtime="codex"
if [[ -f "$HOME/.ai_runtime" ]]; then
    runtime=$(cat "$HOME/.ai_runtime")
fi

repo="henrywhitaker3/containers"
container="ghcr.io/$repo/ai"
tag=$(git ls-remote --refs --tags --sort=-version:refname "https://github.com/$repo.git" "ai-v*" | head -n 1 | awk -F/ '{print $3}')

if [[ -z "$tag" ]]; then
    echo "Unable to find an ai-v* tag for $repo"
    exit 1
fi

image="$container:${tag#ai-}"

if [[ "$runtime" == "codex" ]]; then
    docker run --rm -it \
        -u "$(id -u):$(id -g)" \
        -v "$(pwd):/workspace" \
        -v "$HOME/.codex:/home/codex/.codex" \
        -v "$HOME/.cache/go-build:/home/codex/.cache/go-build" \
        -v "$HOME/go/pkg/mod:/home/codex/go/pkg/mod" \
        "$image" \
        codex --no-daemon "$@"
elif [[ "$runtime" == "claude" ]]; then
    docker run --rm -it \
        -u "$(id -u):$(id -g)" \
        -v "$(pwd):/workspace" \
        -v "$HOME/.claude:/home/codex/.claude" \
        -v "$HOME/.cache/go-build:/home/codex/.cache/go-build" \
        -v "$HOME/go/pkg/mod:/home/codex/go/pkg/mod" \
        "$image" \
        claude "$@"
else
    echo "Unknown runtime"
    exit 1
fi
