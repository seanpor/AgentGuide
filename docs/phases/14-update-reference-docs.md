# Phase 14: Update Reference Docs for Phase 13 Guardrail Additions

**Status:** Completed
**Date:** 2026-05-30

## Goal

Update the standalone quick-reference documents (`docs/reference/agent-code-review-checklist.md` and `docs/reference/pre-merge-checklist.md`) to reflect the content added in Phase 13: behavioural vulnerabilities, SBOM/typosquatting governance, and the human ownership rule.

## Rationale

The reference docs are the quick-card versions of the main document's Section XII (code review) and the pre-merge checklist. Phase 13 added three new concepts to the main document. The reference docs must stay in sync.

## Changes Made

### 1. `agent-code-review-checklist.md`

Added three new sections:

- **Section 6: Behavioural Vulnerabilities** — checklist items for auth-on-one-path, client-trusted state, replay-without-revalidation, and adversarial mental execution.
- **Section 7: Dependency Provenance** — checklist items for typosquatting verification, allowlist conformance, SBOM updates, and CVE scanning.
- **Section 8: Human Ownership** — checklist item for designated human owner who can explain and maintain the code.

### 2. `pre-merge-checklist.md`

Three changes:

- **Item 10 expanded** — now covers typosquatting verification, SBOM updates, and CVE scanning alongside the original "no unnecessary dependencies" rule.
- **Item 12 added** — behavioural vulnerabilities review.
- **Item 13 added** — designated human owner exists.

## Verification

- `make lint`: all checks pass
- No new technical terms added (all terms already in dictionary or plain English)
- Single commit, atomic change

## Acceptance Criteria

- [x] `agent-code-review-checklist.md` has a "Behavioural Vulnerabilities" section
- [x] `agent-code-review-checklist.md` has a "Dependency Provenance" section
- [x] `agent-code-review-checklist.md` has a "Human Ownership" section or item
- [x] `pre-merge-checklist.md` item 10 covers typosquatting, SBOM, and CVE scanning
- [x] `pre-merge-checklist.md` has a behavioural vulnerabilities item
- [x] `pre-merge-checklist.md` has a human ownership item
- [x] `make lint` passes with zero errors
- [x] All changes committed to `main` in a single atomic commit
