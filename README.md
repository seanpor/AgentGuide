# AgentGuide

A guide to writing production code with AI agents, with a containerised lint toolchain that enforces UK English and markdown formatting. All tool versions are pinned for reproducibility, and automated version drift detection alerts when updates are available.

**Start here: [writing-production-code.md](writing-production-code.md) — the full guide.**

## Quick Start

```bash
# Clone the repo
git clone <repo-url>
cd AgentGuide

# Run the linter
make lint

# Check for version drift
make check-versions
```

The first run builds a Docker image (~20 seconds). Subsequent runs skip the build unless the Dockerfile changes.

## Available Commands

| Command              | Description                                    |
| -------------------- | ---------------------------------------------- |
| `make lint`          | Run all lint checks (markdown + spelling)      |
| `make lint-md`       | Run markdown formatting checks                 |
| `make lint-spell`    | Run UK English spelling checks                 |
| `make check-versions`| Check for tool version drift                   |
| `make build`         | Build the Docker lint image                    |
| `make clean`         | Remove the Docker image and build stamp        |

## Project Structure

```text
AgentGuide/
├── writing-production-code.md    # The main guide
├── Makefile                      # Lint targets and build orchestration
├── Dockerfile                    # Lint toolchain (pinned versions)
├── .markdownlint.json            # Markdown formatting rules
├── .hunspell_en_GB               # Custom UK English dictionary
├── AGENTS.md                     # Guardrails for AI agents
├── .github/workflows/lint.yml    # CI configuration
├── scripts/
│   └── check-versions.sh         # Version drift detection
├── docs/reference/
│   ├── README.md                 # Reference materials index
│   ├── pre-merge-checklist.md    # 11-point pre-merge checklist
│   └── agent-code-review-checklist.md  # Agent failure mode checks
└── docs/phases/
    └── *.md                      # Project phase documents
```

## Reference Materials

Quick-reference documents for daily use with the guide:

| File | Description |
| ---- | ----------- |
| `docs/reference/pre-merge-checklist.md` | 11-point checklist for reviewing agent code before merging |
| `docs/reference/agent-code-review-checklist.md` | Common agent failure modes and what to check for |
| `writing-production-code.md#appendix-a-glossary-of-terms` | Glossary of technical terms |
| `writing-production-code.md#appendix-b-decision-trees` | Decision aids for agent usage |
| `writing-production-code.md#appendix-c-prompt-templates` | Reusable prompt templates for common tasks |
| `writing-production-code.md#appendix-d-suggested-reading-path` | Staged learning plan for junior engineers |

## Language

All documentation in this repository uses UK English spelling and grammar (e.g., *behaviour*, *standardise*, *optimise*, *colour*). Run `make lint-spell` to verify.

## Adding Technical Terms

When you add a new technical term to the guide (e.g., "blockchain", "microservice"), add it to `.hunspell_en_GB`:

1. Open `.hunspell_en_GB`
2. Add the term in alphabetical order (case-sensitive: both `API` and `api` if both forms appear)
3. Run `make lint-spell` to verify
4. Commit the change

## Updating Tool Versions

When `make check-versions` reports drift:

1. Read the changelog for the new version
2. Test the new version locally: update the Dockerfile, run `make clean && make build && make lint`
3. If tests pass, commit the updated Dockerfile with a clear message: "Update markdownlint-cli2 to 0.23.0"
4. Update the version comments in the Dockerfile

## Continuous Integration

The repository uses GitHub Actions to enforce the lint pipeline:

- Every push to `main` runs `make lint`
- Every pull request runs `make lint`
- PRs cannot be merged if lint fails
- `make check-versions` runs but does not block merges (warnings only)

See `.github/workflows/lint.yml` for the full configuration.

## Troubleshooting

### "make lint fails with 'Cannot connect to the Docker daemon'"

Docker is not running. Start Docker Desktop or the Docker daemon.

### "make lint fails with 'markdownlint-cli2: command not found'"

The Docker image is not built. Run `make build` first.

### "make lint-spell flags a word as misspelled"

If it is a technical term, add it to `.hunspell_en_GB`. If it is a US spelling, change it to UK English (e.g., "color" to "colour").

### "make check-versions reports drift"

See [Updating Tool Versions](#updating-tool-versions) above.

### "CI fails on my pull request"

Run `make lint` locally and fix the errors. The CI runs the same checks.

## Contributing

See `AGENTS.md` for guardrails when working on this repository with AI agents.
