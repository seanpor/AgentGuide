# Phase 10: Makefile Default Target

## Objective

Add a `default` target that displays available commands when a user types `make` without arguments. Currently, typing `make` runs `build`, which builds the Docker image — a surprising default for someone who just wants to see what is available.

## Why This Matters

The first target in a Makefile is the default. The current first target is `build`, which triggers a Docker image build. A user exploring the project who types `make` expects to see help, not to trigger an expensive build. This is a basic usability convention followed by most well-maintained Makefiles: the default target should show usage information.

## What To Do

1. Add `default` to the `.PHONY` declaration.
2. Insert a `default` target as the first target in the Makefile, before `build`.
3. The default target should print a brief listing of available targets and their purpose.

## Acceptance Criteria

- [ ] `make` (without arguments) prints available targets and exits cleanly
- [ ] `make lint` continues to pass with exit code 0
- [ ] All other targets (`build`, `lint-md`, `lint-spell`, `check-versions`, `clean`) continue to work exactly as before
- [ ] `.PHONY` includes the `default` target

## Dependencies

None. This is a standalone usability improvement.

## Estimated Time

5 minutes.
