# Phase 22: Replace Editor Standardisation Example in Environmental Invariants

**Status:** Completed
**Date:** 2026-05-30

## Goal

Replace the `EDITOR=vi` example in Section VII (Environmental Invariants) with one relevant to agentic engineering. In an agent-driven workflow the human rarely opens an editor directly, so the editor standardisation example is a poor fit.

## Change

- **Before:** `EDITOR=vi` — ensures predictable interface when human intervenes in sandbox
- **After:** **Filesystem immutability** — certain directories (`/etc`, `/usr`, `.github/`) mounted read-only so the agent cannot tamper with system config or governance files from within the sandbox

## Rationale

The editor example describes a human workflow concern in what should be a list of agent-facing environmental constraints. Filesystem immutability is a directly enforceable invariant that complements the immutable Makefile and Repository Hardening concepts already in Section VII.

## Verification

- `make enforce`: all checks pass

## Acceptance Criteria

- [ ] `EDITOR=vi` example removed
- [ ] Filesystem immutability example added in its place
- [ ] `make enforce` passes with zero errors
- [ ] Change committed to `main`
