# Agentic System Rules

**Project:** AgentGuide — A guide to writing production code with AI agents.
**Language:** UK English exclusively (behaviour, standardise, optimise, colour).

## 1. Execution Invariants

- **Lint:** You must run `make enforce` before considering any task complete. All checks must pass.
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

- Every pull request must pass `make enforce`.
- Every pull request must pass `make check-versions` (version drift warnings do not block merge, but must be documented).
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

- After any change, run `make enforce` and verify it passes.
- After modifying the Dockerfile, run `make clean && make build && make lint`.
- After adding new technical terms to documentation, add them to `.hunspell_en_GB`.

## 7. When to Ask

Stop and ask for human guidance when:

- A lint check fails and you cannot determine why.
- You need to modify an immutable file.
- You are unsure whether a change violates project conventions.
- The task is ambiguous or underspecified.
