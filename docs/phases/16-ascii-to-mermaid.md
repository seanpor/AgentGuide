# Phase 16: Convert ASCII Diagrams to Mermaid

**Status:** Completed
**Date:** 2026-05-30

## Goal

Replace all 8 ASCII art text diagrams in `writing-production-code.md` with Mermaid diagrams for clearer rendering on GitHub and other Mermaid-compatible viewers.

## Diagrams Converted

| # | Section | ASCII Lines | Mermaid Type | Description |
| --- | --------- | ------------- | -------------- | ------------- |
| 1 | IV. The Iteration Loop | 274–292 | `flowchart TD` | Prompt → Generate → Review → Identify → Agent fixes loop |
| 2 | VI. The Layered Defence Model | 403–420 | `flowchart BT` | Five-layer containment stack (Agent → VM → eBPF → cgroups → Thermal) |
| 3 | VII. Enforcement Pipeline | 513–538 | `flowchart TD` | Four-gate sequential pipeline with PASS/FAIL branches |
| 4 | IX. Software Data Diodes | 824–832 | `flowchart LR` | One-way flow: Agent → Output Folder → Human Reviewer → Production |
| 5 | X. Multi-Model Roster | 903–939 | `flowchart TD` | Orchestrator → Executor → Code Output → N-version review loop |
| 6 | Appendix B, Tree 1 | 1452–1488 | `flowchart TD` | Decision tree: should I use an agent? |
| 7 | Appendix B, Tree 2 | 1492–1520 | `flowchart TD` | Decision tree: iterate or regenerate? |
| 8 | Appendix B, Tree 3 | 1524–1540 | `flowchart TD` | Decision tree: which verification technique? |

## Rules Applied

- All code blocks changed from ` ```text ` to ` ```mermaid `
- Mermaid `flowchart` type chosen over `graph` for explicit direction control
- No information loss — all labels, branches, and outcomes preserved
- Line breaks in node labels use `<br/>` (HTML-style) for Mermaid compatibility

## Verification

- `make lint`: all checks pass
- Mermaid code blocks render correctly on GitHub (no syntax errors verified against Mermaid spec)
- No content changes outside the diagram blocks

## Acceptance Criteria

- [x] All 8 ASCII diagrams replaced with Mermaid equivalents
- [x] Markdown language specifier updated from `text` to `mermaid`
- [x] No information lost in any diagram
- [x] `make lint` passes with zero errors
- [x] All changes committed to `main` in a single atomic commit
