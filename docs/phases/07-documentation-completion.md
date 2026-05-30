# Phase 7: Documentation Completion

## Objective

Update the `README.md` with comprehensive usage documentation, troubleshooting guidance, and contributor instructions. This is the final phase that ties everything together and makes the repository self-documenting.

## Why This Matters

From our guide, Section XIV (The Professional Habits):

> The minimum viable documentation is: a README that explains what the project does and how to run it, inline comments that explain *why* (not *what*), and an AGENTS.md file that tells the agent what it needs to know.

Phase 1 created a minimal README. Now that we have version pinning, drift detection, build optimisation, agent guardrails, and CI/CD, the README needs to document all of this. A new contributor should be able to read the README and understand:

- What this project is
- How to use the lint toolchain
- How to add new technical terms
- How to update tool versions
- How the CI works
- What to do when something breaks

## What To Do

### 1. Expand the README

Update `README.md` with these sections:

#### Overview

One paragraph explaining what this repo is: a guide to writing production code with AI agents, with a containerised lint toolchain that enforces UK English and markdown formatting.

#### Quick Start

```bash
# Clone the repo
git clone <repo-url>
cd AgentGuide

# Run the linter
make lint

# Check for version drift
make check-versions
```

#### Available Commands

A table of all Makefile targets:

| Command | Description |
|---|---|
| `make lint` | Run all lint checks (markdown + spelling) |
| `make lint-md` | Run markdown formatting checks |
| `make lint-spell` | Run UK English spelling checks |
| `make check-versions` | Check for tool version drift |
| `make build` | Build the Docker lint image |
| `make clean` | Remove the Docker image and build stamp |

#### Project Structure

Explain what each file does:

```
AgentGuide/
├── writing-production-code.md    # The main guide
├── Makefile                      # Lint targets
├── Dockerfile                    # Lint toolchain (pinned versions)
├── .markdownlint.json            # Markdown formatting rules
├── .hunspell_en_GB               # Custom UK English dictionary
├── AGENTS.md                     # Guardrails for AI agents
├── .github/workflows/lint.yml    # CI configuration
├── scripts/
│   └── check-versions.sh         # Version drift detection
└── docs/phases/
    └── *.md                      # Project phase documents
```

#### Adding Technical Terms

When you add a new technical term to the guide (e.g., "blockchain", "microservice"), add it to `.hunspell_en_GB`:

1. Open `.hunspell_en_GB`
2. Add the term in alphabetical order (case-sensitive: both `API` and `api` if both forms appear)
3. Run `make lint-spell` to verify
4. Commit the change

#### Updating Tool Versions

When `make check-versions` reports drift:

1. Read the changelog for the new version
2. Test the new version locally: update the Dockerfile, run `make clean && make build && make lint`
3. If tests pass, commit the updated Dockerfile with a clear message: "Update markdownlint-cli2 to 0.23.0"
4. Update the version comments in the Dockerfile

#### Continuous Integration

The repository uses GitHub Actions to enforce the lint pipeline:

- Every push to `main` runs `make lint`
- Every pull request runs `make lint`
- PRs cannot be merged if lint fails
- `make check-versions` runs but does not block merges (warnings only)

See `.github/workflows/lint.yml` for the full configuration.

#### Troubleshooting

**"make lint fails with 'Cannot connect to the Docker daemon'"**

Docker is not running. Start Docker Desktop or the Docker daemon.

**"make lint fails with 'markdownlint-cli2: command not found'"**

The Docker image is not built. Run `make build` first.

**"make lint-spell flags a word as misspelled"**

If it's a technical term, add it to `.hunspell_en_GB`. If it's a US spelling, change it to UK English (e.g., "color" → "colour").

**"make check-versions reports drift"**

See "Updating Tool Versions" above.

**"CI fails on my pull request"**

Run `make lint` locally and fix the errors. The CI runs the same checks.

### 2. Verify the README

Read the README from start to finish. Verify:

- A new contributor can follow the Quick Start without confusion
- All Makefile targets are documented
- All files in the project structure are explained
- The troubleshooting section covers common issues
- The README is under 200 lines (comprehensive but not verbose)

### 3. Test the Documentation

Give the README to someone who has never seen this repo. Ask them to:

1. Clone the repo
2. Run `make lint`
3. Add a new technical term to the dictionary
4. Run `make check-versions`

Verify they can do all four without asking questions.

## Acceptance Criteria

Before renaming this file to `07-documentation-completion_COMPLETED.md`, verify:

- [ ] `README.md` contains all sections listed above
- [ ] `README.md` is under 200 lines
- [ ] `README.md` uses UK English exclusively
- [ ] All Makefile targets are documented with descriptions
- [ ] Project structure is documented with explanations of each file
- [ ] Instructions for adding technical terms are clear and correct
- [ ] Instructions for updating tool versions are clear and correct
- [ ] CI/CD behaviour is documented
- [ ] Troubleshooting section covers at least 5 common issues
- [ ] A new contributor can follow the README without asking questions
- [ ] `make lint` still passes (no regressions)

## Dependencies

- Phase 1 (Foundation) — initial README
- Phase 2 (Version Pinning) — document version updates
- Phase 3 (Version Drift Detection) — document check-versions
- Phase 4 (Build Optimisation) — document build behaviour
- Phase 5 (Agent Guardrails) — document AGENTS.md
- Phase 6 (CI/CD) — document CI behaviour

## Estimated Time

30-45 minutes.
