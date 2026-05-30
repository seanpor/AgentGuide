# Phase 18: Compact Mermaid Diagrams

**Status:** In Progress
**Date:** 2026-05-30

## Goal

Shorten all 8 Mermaid flowcharts in `writing-production-code.md` so they fit on a small laptop screen (1366×768 or smaller) with minimal scrolling. Node labels should be terse but unambiguous — the surrounding prose provides full context.

## Changes Made

| # | Section | Original Lines | Strategy |
| --- | --------- | -------------- | --------- |
| 1 | IV. Iteration Loop | 10 | Shrink `Identify specific problems` → `Identify problems`, `Agent fixes specific issues` → `Agent fixes` |
| 2 | VI. Layered Defence | 10 | Drop parenthetical explanations from each node label; the prose already defines each layer |
| 3 | VII. Enforcement Pipeline | 12 | Shorten `Code written by agent` → `Code`; shorten REJECTED subtitles (`Code looks wrong` → `Formatting`, etc.) |
| 4 | IX. Data Diodes | 5 | Drop `one-way` label redundancy; shorten `AGENT SANDBOX<br/>No outbound access` → `AGENT SANDBOX`; shorten `OUTPUT FOLDER<br/>one-way` → `OUTPUT FOLDER` |
| 5 | X. Multi-Model Roster | 14 | Shorten node labels and edge labels |
| 6 | Appendix B, Tree 1 | 17 | Condense multi-line questions to single-line; shrink answer nodes from 2-3 lines to 1 line |
| 7 | Appendix B, Tree 2 | 13 | Same strategy: shorter questions, single-line answers |
| 8 | Appendix B, Tree 3 | 9 | Minimal shortening — already compact; tighten `What are you trying to verify?` → `What to verify?` |

## Rules Applied

- Every node label must remain understandable in isolation but need not repeat context from the prose
- Diamond nodes (decisions) use `?` suffix to signal they are questions
- No structural changes: same topology, same flow, same branching
- `flowchart` type and direction (`TD`, `BT`, `LR`) preserved for each diagram

## Verification

- `make lint`: all checks pass

## Acceptance Criteria

- [ ] All 8 diagrams have shorter node labels without losing meaning
- [ ] Diagram structure (nodes, branches, directions) unchanged
- [ ] No information is lost that would make a diagram misleading without its surrounding text
- [ ] `make lint` passes with zero errors
- [ ] All changes committed to `main` in a single atomic commit
