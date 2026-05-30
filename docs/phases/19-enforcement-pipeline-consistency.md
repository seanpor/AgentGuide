# Phase 19: Enforcement Pipeline Consistency

**Status:** In Progress
**Date:** 2026-05-30

## Goal

Fix all numbering and terminology inconsistencies found in the consistency audit of `writing-production-code.md` and its supporting files. The enforcement pipeline is described as "Four Lines of Defence" (heading), "five stages" (diagram), and "three layers" (key takeaway) — three different counts for the same thing. This phase resolves all three to "Five Lines of Defence" and fixes five other inconsistencies found during the audit.

## Audit Findings

| # | Category | Severity | Description | Locations |
| --- | ---------- | ---------- | ------------- | ----------- |
| 1 | Pipeline numbering | High | "Four Lines" heading (l.489) says 4, diagram (ll.493-505) shows 5 stages (Formatters, Linters, Scanners, Secrets, Tests), key takeaway (l.598) says "three layers" | ll.45, 489, 491, 493-505, 598 |
| 2 | Pre-merge checklist | High | Main doc has 11 items (ll.1041-1051); reference file has 13 — items 12 (behavioural vulns) and 13 (human owner) missing from main doc; items 9-10 wording differs | ll.1041-1051 vs `docs/reference/pre-merge-checklist.md` |
| 3 | Makefile target | High | Doc teaches `make enforce` everywhere; real Makefile has no `enforce` target; real AGENTS.md says `make lint` | Doc ll.487, 577, 598, 1042 vs Makefile l.22, AGENTS.md |
| 4 | Template numbering | Medium | Appendix C templates numbered 1, 2, 3, **5, 4** (out of sequence) | ll.1520, 1547 |
| 5 | Stale reference | Medium | Phase 08 design doc still says "The Three Lines of Defence" | `docs/phases/08-reference-architecture_COMPLETED.md` l.63 |
| 6 | Reference doc omissions | Medium | Phase 08 subsection table missing 6 headings that exist in the live doc: Agentic Debt, Estimating Agent Effort, The Hazards of Working with Machines..., What Not to Paste, Debugging Code You Did Not Write, The Ownership Paradox; also includes "Pre-Merge Checklist" as an appendix when it is a reference file | Same file, ll.57-72 |
| 7 | TOC completeness | Low | Appendices A-D not listed in TOC — reader scanning the TOC cannot discover them | ll.7-102 |
| 8 | Diagram ambiguity | Low | Multi-Model Roster diagram shows generic "Review" node but prose says Orchestrator performs the review | ll.873-887 vs 889-893 |

## Changes Made

### Bucket A: Enforcement Pipeline

- **A1:** Heading/prose: "Four Lines of Defence" → "Five Lines of Defence" (TOC, heading, prose)
- **A2:** Added 5th paragraph describing **Tests** as a line of defence
- **A3:** Key takeaway (l.598): "three layers — formatters, linters, scanners" → "five layers — formatters, linters, scanners, secrets, and tests"
- **A4:** Added `make enforce` alias to real Makefile (depends on `lint`)
- **A5:** Phase 08 design doc: "The Three Lines of Defence" → "The Five Lines of Defence"

### Bucket B: Pre-Merge Checklist

- **B6:** Synced main doc checklist items 9-10 wording with reference file; added items 12-13 (behavioural vulnerabilities, designated human owner)

### Bucket C: Cleanup

- **C7:** Reordered Appendix C templates (5→4, 4→5)
- **C8:** Added Appendices A-D to TOC
- **C9:** Added 6 missing subsections to phase 08 reference doc subsection table; removed stale "Pre-Merge Checklist" appendix entry
- **C10:** Clarified Multi-Model Roster review node label

## Verification

- `make lint`: all checks pass

## Acceptance Criteria

- [ ] Enforcement pipeline consistently called "Five Lines of Defence" throughout (heading, prose, TOC, key takeaway)
- [ ] Tests are explicitly listed as the 5th line of defence with a dedicated prose paragraph
- [ ] `make enforce` is an alias for `make lint` in the real Makefile
- [ ] Pre-merge checklist in main doc matches reference file (13 items, same wording)
- [ ] Appendix C templates numbered sequentially 1-5
- [ ] TOC includes links to all 4 appendices
- [ ] Phase 08 reference doc subsection table matches actual document structure
- [ ] Multi-Model Roster diagram clearly shows the Orchestrator performs the review
- [ ] `make lint` passes with zero errors
- [ ] All changes committed to `main` in a single atomic commit
