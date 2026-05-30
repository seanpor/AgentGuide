# Phase 5: Agent Guardrails

## Objective

Create an `AGENTS.md` file that provides clear, terse guardrails for any AI agent working on this repository. This file tells the agent what it can and cannot do, what conventions to follow, and where to find more information.

## Why This Matters

From our guide, Section VII (The Enforcement Pipeline):

> The agent operates within the rules; it does not write them.

An agent working on this repo without an `AGENTS.md` file has no context about:

- The UK English requirement
- The immutable Makefile
- The lint pipeline that must pass
- Which files are off-limits
- Where to find documentation about specific areas

This leads to the agent making changes that violate project conventions, modifying files it shouldn't, or producing output that fails `make lint`.

The `AGENTS.md` file is the agent's contract with the repository. It's read at the start of every session and provides the minimal context needed to work effectively.

## What To Do

### 1. Create AGENTS.md

Create an `AGENTS.md` file at the repo root with these sections:

```markdown
# Agentic System Rules

**Project:** AgentGuide — A guide to writing production code with AI agents.
**Language:** UK English exclusively (behaviour, standardise, optimise, colour).

## 1. Execution Invariants

- **Lint:** You must run `make lint` before considering any task complete. All checks must pass.
- **Spelling:** Use UK English in all documentation and comments. Run `make lint-spell` to verify.
- **Formatting:** Markdown files must pass `make lint-md`. Code blocks must have language specifiers.

## 2. Immutable Files

You must not modify these files without explicit human approval:

- `Makefile` — The enforcement pipeline. The agent operates within the rules; it does not write them.
- `.markdownlint.json` — Markdown formatting rules.
- `.hunspell_en_GB` — Custom dictionary. Add new technical terms, but do not remove existing ones.
- `Dockerfile` — Tool versions are pinned for reproducibility. Updates require version drift analysis.
- `AGENTS.md` — This file. The agent does not modify its own guardrails.

## 3. CI/CD Gates

- Every pull request must pass `make lint`.
- Every pull request must pass `make check-versions` (no version drift warnings block merge, but must be documented).
- No merge without human code review.

## 4. Context Routing

Read these files only when modifying their specific domains:

- `docs/phases/*.md` — Read before working on project phases. Each phase has acceptance criteria that must be met.
- `writing-production-code.md` — The main document. Read before editing content.
- `scripts/check-versions.sh` — Read before modifying version checking logic.

## 5. Commit Conventions

- Commit messages must be in the imperative mood: "Add feature" not "Added feature".
- Each commit must be atomic: one logical change per commit.
- Commit messages must explain what and why, not just what.
- Example: "Pin codespell to 2.4.2 for reproducible lint builds"

## 6. Testing

- After any change, run `make lint` and verify it passes.
- After modifying the Dockerfile, run `make clean && make build && make lint`.
- After adding new technical terms to documentation, add them to `.hunspell_en_GB`.

## 7. When to Ask

Stop and ask for human guidance when:

- A lint check fails and you cannot determine why.
- You need to modify an immutable file.
- You are unsure whether a change violates project conventions.
- The task is ambiguous or underspecified.
```

### 2. Verify the File

Read the `AGENTS.md` file and verify:

- It's under 80 lines (terse, not verbose)
- It uses UK English
- It's opinionated (clear rules, not suggestions)
- It covers all the areas an agent needs to know about

### 3. Test with an Agent

If you have access to an AI agent, give it this task:

> "Read AGENTS.md and then add a new section to writing-production-code.md about testing strategies."

Verify that the agent:

- Reads `AGENTS.md` first
- Runs `make lint` after making changes
- Uses UK English
- Does not modify immutable files
- Writes a clear commit message

## Acceptance Criteria

Before renaming this file to `05-agents-guardrails_COMPLETED.md`, verify:

- [ ] `AGENTS.md` exists at the repo root
- [ ] `AGENTS.md` is under 80 lines
- [ ] `AGENTS.md` uses UK English exclusively
- [ ] `AGENTS.md` contains all seven sections listed above
- [ ] `AGENTS.md` explicitly lists immutable files
- [ ] `AGENTS.md` explicitly requires `make lint` to pass
- [ ] `AGENTS.md` includes context routing for documentation
- [ ] `AGENTS.md` includes commit message conventions
- [ ] `AGENTS.md` includes guidance on when to ask for help
- [ ] `make lint` still passes (no regressions)

## Dependencies

- Phase 1 (Foundation) — need basic repo structure
- Phase 2 (Version Pinning) — need to document Dockerfile as immutable
- Phase 3 (Version Drift Detection) — need to document `check-versions` in CI/CD gates

## Estimated Time

20-30 minutes.
