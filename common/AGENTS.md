# Global Agents Guidance

## Dev environment tips

- If a `mise.toml` tool exists, call tooling with `mise exec -- <tool>`, not directly.
- Common tasks, `lint`, `test`, `format` should be called with `mise run <task>` if a `mise.toml` file exists,
or `task <task>` if a `Taskfile.yaml` exists. If neither do, create a new `mise.toml` file and add the task to it

### Secrets and sensitive data

- Never print secrets (tokens, private keys, credentials) to terminal output.
- Do not request users paste secrets.
- Avoid commands that might expose secrets (e.g., dumping env vars broadly, `cat ~/.ssh/*`).
- Prefer existing authenticated CLIs; redact sensitive strings in any displayed output.

## Baseline workflow

- Start every task by determining:
  1. Goal + acceptance criteria.
  2. Constraints (time, safety, scope).
  3. What must be inspected (files, commands, tests, docs).
  4. If requirements are ambiguous, ask targeted clarifying questions before making irreversible changes.

## Code Style

### No Comments

- Code should be self-explanatory. Comments should be avoided as much as possible.
- Write clear, descriptive variable and function names
- Structure code so its intent is obvious
- Only add comments if absolutely required (e.g., explaining a non-obvious workaround or complex algorithm that cannot be simplified)
- If code needs a comment to be understood, refactor it first

### Golang

- Code should be formatted using `gofmt` and `golines`
- For testing, use `github.com/stretchr/testify` for `assert`/`require` using built-ins like `ErrorIs()`, `Equal()`, `Nil()`, `NotNil()` etc.

## Model Selection Rules

- **Default Subagent Model:** `gpt-5.6-luna`
- **Default Subagent Reasoning Effort:** `high`
- **Primary / Orchestrator Model:** `gpt-5.6-terra` (for planning, architecture, and high-risk changes)
- **Everyday Execution Model:** `gpt-5.6-terra` (for standard feature implementation)

## Task Allocation

- Use **Luna** for: file formatting, bulk renaming, extracting structured schemas, and repetitive doc updates.
- Use **Terra** for: scoped feature tickets, standard bug fixes, and implementation passes.
- Use **Sol** for: multi-file refactoring, security audits, architecture design, and final verification.

## Constraints & Rules

- Do not let Luna make architectural decisions or write complex business logic without a spec.
