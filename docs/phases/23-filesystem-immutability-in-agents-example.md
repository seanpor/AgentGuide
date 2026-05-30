# Phase 23: Fix Filesystem Immutability in Example AGENTS.md

**Status:** Completed
**Date:** 2026-05-30

## Goal

Fix the same `vi` editor reference in the example AGENTS.md code block that was already fixed in the Environmental Invariants prose (Phase 22).

## Change

- **Before:** `- **Editors:** You are running in a strict `vi` environment.`
- **After:** `- **Filesystem:** The sandbox mounts /etc, /usr, and .github/ as read-only. The agent cannot modify system configuration or its own governance files.`

## Rationale

Phase 22 fixed the Environmental Invariants prose but missed the embedded example AGENTS.md. Both need to show agent-relevant invariants.

## Verification

- `make enforce`: all checks pass

## Acceptance Criteria

- [ ] Example AGENTS.md no longer references `vi`
- [ ] Filesystem immutability example shown in both the prose and the code block
- [ ] `make enforce` passes with zero errors
