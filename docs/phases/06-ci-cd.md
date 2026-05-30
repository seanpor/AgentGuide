# Phase 6: Continuous Integration

## Objective

Set up GitHub Actions to automatically run `make lint` and `make check-versions` on every push and pull request. This ensures that no code is merged without passing the enforcement pipeline.

## Why This Matters

From our guide, Section XIV (The Professional Habits):

> CI is the safety net that catches what local enforcement misses. Every push triggers the full enforcement pipeline. Every pull request must pass before merging. No exceptions, no overrides, no "I'll fix it in the next PR."

Right now, `make lint` only runs when someone remembers to run it locally. This means:

- A contributor could push code that fails linting, and no one notices until the next person pulls and runs `make lint`.
- A pull request could be merged without anyone checking if it passes the enforcement pipeline.
- Version drift could go unnoticed for weeks.

CI eliminates these gaps. Every push is checked. Every PR is verified. The enforcement pipeline runs automatically, and failures block merges.

## What To Do

### 1. Create the GitHub Actions Workflow

Create `.github/workflows/lint.yml`:

```yaml
name: Lint

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  lint:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      
      - name: Build lint image
        run: make build
      
      - name: Run markdown lint
        run: make lint-md
      
      - name: Run spell check
        run: make lint-spell
      
      - name: Check version drift
        run: make check-versions
        continue-on-error: true
```

### 2. Understand the Workflow

- **Triggers:** Runs on every push to `main` and every pull request targeting `main`.
- **Checkout:** Uses `actions/checkout@v4` to get the code.
- **Buildx:** Uses `docker/setup-buildx-action@v3` for faster Docker builds.
- **Build:** Runs `make build` to build the lint image.
- **Lint:** Runs `make lint-md` and `make lint-spell`. If either fails, the workflow fails and the PR cannot be merged.
- **Version Check:** Runs `make check-versions` with `continue-on-error: true`. This means version drift warnings don't block merges, but they're visible in the logs.

### 3. Test Locally

Before pushing, verify the workflow syntax:

```bash
# Install actionlint (optional but recommended)
# https://github.com/rhysd/actionlint

# Or just verify the YAML is valid
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/lint.yml'))"
```

### 4. Push and Verify

Push the workflow to GitHub:

```bash
git add .github/workflows/lint.yml
git commit -m "Add GitHub Actions CI for lint enforcement"
git push
```

Then:

- Go to the "Actions" tab in your GitHub repo
- Verify the workflow ran successfully
- Open a test PR with a lint violation (e.g., add a US spelling like "color")
- Verify the PR check fails
- Fix the violation and verify the check passes

### 5. Protect the Main Branch

In GitHub repo settings:

1. Go to Settings → Branches → Add rule
2. Branch name pattern: `main`
3. Enable "Require status checks to pass before merging"
4. Add the `lint` job as a required check
5. Enable "Require branches to be up to date before merging"
6. Save

This ensures no PR can be merged without passing `make lint`.

## Acceptance Criteria

Before renaming this file to `06-ci-cd_COMPLETED.md`, verify:

- [ ] `.github/workflows/lint.yml` exists and is valid YAML
- [ ] The workflow triggers on push to `main` and on pull requests
- [ ] The workflow runs `make build`, `make lint-md`, and `make lint-spell`
- [ ] The workflow runs `make check-versions` with `continue-on-error: true`
- [ ] Pushing the workflow to GitHub triggers a successful run in the Actions tab
- [ ] Opening a PR with a lint violation causes the check to fail
- [ ] Fixing the violation causes the check to pass
- [ ] The `main` branch is protected and requires the `lint` check to pass
- [ ] The workflow uses pinned action versions (`@v4`, `@v3`), not `@latest`
- [ ] `make lint` still passes locally (no regressions)

## Dependencies

- Phase 1 (Foundation) — need basic repo structure
- Phase 2 (Version Pinning) — need reproducible builds
- Phase 3 (Version Drift Detection) — need `check-versions` target

## Estimated Time

30-45 minutes.
