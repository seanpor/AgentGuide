# Project Plan: AgentGuide Repository Hardening

## Overview

This project plan transforms the AgentGuide repository from a basic document with a lint toolchain into a robust, reliable, production-grade project that follows its own principles.

The plan has seven phases, each with clear acceptance criteria. A phase is complete only when all acceptance criteria are met and the phase document is renamed to `*_COMPLETED.md`.

## Goal

A repository that:

- **Reproduces reliably** — pinned tool versions ensure `make lint` produces identical results today, next week, and next year
- **Detects drift proactively** — automated version checking alerts us when tools are outdated
- **Builds efficiently** — Docker images only rebuild when necessary
- **Enforces consistently** — CI runs the lint pipeline on every push and PR
- **Guides clearly** — AGENTS.md provides guardrails for AI agents working on the repo
- **Documents thoroughly** — README explains how to use everything

## Phases

| Phase | Title | Status | Dependencies | Est. Time |
|---|---|---|---|---|
| 1 | Foundation | Not started | None | 15-20 min |
| 2 | Version Pinning | Not started | Phase 1 | 20-30 min |
| 3 | Version Drift Detection | Not started | Phase 2 | 30-45 min |
| 4 | Build Optimisation | Not started | Phase 1 | 15-20 min |
| 5 | Agent Guardrails | Not started | Phases 1, 2, 3 | 20-30 min |
| 6 | Continuous Integration | Not started | Phases 1, 2, 3 | 30-45 min |
| 7 | Documentation Completion | Not started | All previous phases | 30-45 min |

**Total estimated time:** 2.5-4 hours

## Dependency Graph

```
Phase 1 (Foundation)
  ├─> Phase 2 (Version Pinning)
  │     └─> Phase 3 (Version Drift Detection)
  │           ├─> Phase 5 (Agent Guardrails)
  │           └─> Phase 6 (CI/CD)
  └─> Phase 4 (Build Optimisation)

All phases ─> Phase 7 (Documentation Completion)
```

## Recommended Order

1. **Phase 1** — Foundation (no dependencies, quick win)
2. **Phase 2** — Version Pinning (depends on Phase 1)
3. **Phase 3** — Version Drift Detection (depends on Phase 2)
4. **Phase 4** — Build Optimisation (can run in parallel with Phases 2-3)
5. **Phase 5** — Agent Guardrails (depends on Phases 1, 2, 3)
6. **Phase 6** — CI/CD (depends on Phases 1, 2, 3)
7. **Phase 7** — Documentation Completion (depends on all previous phases)

## How to Use This Plan

### For Each Phase

1. **Read the phase document** — understand the objective, why it matters, and what to do
2. **Follow the steps** — implement the changes as described
3. **Verify acceptance criteria** — check every item in the acceptance criteria list
4. **Rename the file** — when all criteria are met, rename `XX-title.md` to `XX-title_COMPLETED.md`
5. **Commit the changes** — use a clear commit message explaining what was done

### Tracking Progress

The status column in the phases table above should be updated as work progresses:

- **Not started** — phase document exists but work has not begun
- **In progress** — work has started but acceptance criteria are not yet met
- **Complete** — all acceptance criteria met, file renamed to `*_COMPLETED.md`

### When to Ask for Help

Stop and ask for guidance when:

- A step in the phase document is unclear
- An acceptance criterion cannot be met
- You encounter an error not covered in the troubleshooting section
- You are unsure whether a change violates project conventions

## Principles

This plan follows the principles outlined in `writing-production-code.md`:

- **Correctness, readability, maintainability** — in that order
- **Never ship code you cannot explain** — understand every change you make
- **Specification as prompting** — the phase documents are specifications; follow them precisely
- **The enforcement pipeline is non-negotiable** — `make lint` must pass after every change
- **Iteration over regeneration** — if a step fails, debug it; don't start over

## Success Criteria

The project is complete when:

- [ ] All seven phase documents are renamed to `*_COMPLETED.md`
- [ ] `make lint` passes
- [ ] `make check-versions` runs successfully
- [ ] GitHub Actions CI passes on the main branch
- [ ] A new contributor can clone the repo, run `make lint`, and understand the project by reading the README
- [ ] An AI agent can work on the repo by reading `AGENTS.md` and following its guardrails
