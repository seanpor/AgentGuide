# Phase 15: Move Language Note to README

**Status:** Completed
**Date:** 2026-05-30

## Goal

Move the UK English language note from the top of `writing-production-code.md` (between the title and the TOC) to the project's `README.md`, where repository-level conventions belong.

## Rationale

The language note is a project-convention notice for contributors, not part of the guide's content. It has no place at the head of the main document.

## Changes Made

### 1. `writing-production-code.md`

Removed the following block (lines 6–9):

```text
**Language note:** This document is written in UK English. All spelling, grammar, and terminology should follow British conventions (e.g., *behaviour*, *standardise*, *optimise*, *colour*). Run `make lint` to check formatting and spelling.
```

The redundant second `---` horizontal rule was also removed, leaving a single rule between the subtitle and the table of contents.

### 2. `README.md`

Added a "Language" section between "Adding Technical Terms" and "Updating Tool Versions":

```text
## Language

All documentation in this repository uses UK English spelling and grammar
(e.g., *behaviour*, *standardise*, *optimise*, *colour*). Run `make lint-spell`
to verify.
```

## Verification

- `make lint`: all checks pass
- No other files reference the language note (confirmed via `grep`)
- Single commit, atomic change

## Acceptance Criteria

- [x] Language note no longer appears in `writing-production-code.md`
- [x] A "Language" section exists in `README.md` with the adapted note
- [x] Only one `---` horizontal rule before the table of contents
- [x] `make lint` passes with zero errors
- [x] All changes committed to `main` in a single atomic commit
