# Phase 1: Foundation

## Objective

Add basic repository hygiene: a `.gitignore` file to prevent accidental commits of build artefacts, and a minimal `README.md` so someone cloning the repo knows what to do next.

## Why This Matters

From our guide, Section XIV (The Professional Habits):

> The minimum viable documentation is: a README that explains what the project does and how to run it.

A repo without a `.gitignore` will eventually commit Docker build caches, IDE configs, or OS files. A repo without a README forces every new contributor to ask "how do I run the linter?"

## What To Do

### 1. Create `.gitignore`

Add a `.gitignore` file at the repo root with these entries:

```
# Docker
.docker/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Python
__pycache__/
*.pyc
*.pyo

# Node
node_modules/

# Build artefacts
*.log
```

### 2. Create `README.md`

Write a minimal README with these sections:

- **What This Is** — one sentence describing the repo
- **Quick Start** — how to run the linter (the `make lint` command)
- **Available Commands** — a table of all Makefile targets
- **Project Structure** — what each file does
- **Contributing** — pointer to AGENTS.md (which we'll add in Phase 5)

Keep it under 100 lines. No tutorials, no philosophy — just "here's how to use this."

## Acceptance Criteria

Before renaming this file to `01-foundation_COMPLETED.md`, verify:

- [ ] `.gitignore` exists and contains entries for Docker, IDE, OS, Python, Node, and build artefacts
- [ ] `README.md` exists and contains all five sections listed above
- [ ] `README.md` is under 100 lines
- [ ] Running `git status` shows no untracked files that should be ignored
- [ ] A person who has never seen this repo can read the README and run `make lint` successfully within 2 minutes
- [ ] `make lint` still passes (no regressions)

## Dependencies

None. This phase has no prerequisites.

## Estimated Time

15-20 minutes.
