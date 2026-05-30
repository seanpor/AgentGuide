# Phase 21: Remove Appendix D (Suggested Reading Path)

**Status:** Completed
**Date:** 2026-05-30

## Goal

Remove Appendix D (Suggested Reading Path for Junior Engineers). The entire document can be read in under an hour, and the "understand this concept now" / "implement this today" hints throughout the text already serve the orienting purpose that a staged reading path was meant to provide.

## Changes

- Removed all content from `## Appendix D: Suggested Reading Path for Junior Engineers` (Week 1/2/3 plans, Reference Only section)
- Removed TOC entry for Appendix D
- Removed trailing `---` separator that was between Appendix C and the removed appendix
- Updated `docs/phases/08-reference-architecture_COMPLETED.md`:
  - Removed "Suggested Reading Path" from the Appendices row in the subsection table
  - Replaced TODO instructions with note that the reading path was removed in Phase 21

## Rationale

The reading path was added in Phase 8 when the document was assumed to be too long to read in one sitting. In practice the document is around 1,600 lines (45-60 minutes of reading), and the inline "practical note" callouts throughout (e.g., "Implement this today", "Understand this concept now") already help readers skip advanced sections on first pass. A separate reading path added maintenance overhead and duplicated what the inline hints achieve.

## Verification

- `make enforce`: all checks pass

## Acceptance Criteria

- [ ] Appendix D and all its content removed from `writing-production-code.md`
- [ ] TOC no longer references Appendix D
- [ ] Phase 08 reference doc updated to reflect removal
- [ ] `make enforce` passes with zero errors
- [ ] All changes committed to `main`
