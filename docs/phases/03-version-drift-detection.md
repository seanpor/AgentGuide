# Phase 3: Version Drift Detection

## Objective

Create a `make check-versions` target that compares the pinned tool versions in our Dockerfile against the latest available versions, and reports any drift. This lets us proactively update dependencies before they become a problem.

## Why This Matters

From our guide, Section III (The Anatomy of Production Code):

> Production code must be observable. It must log its state at key decision points.

Version pinning (Phase 2) gives us reproducibility, but it also means we're frozen in time. Without drift detection, we won't know that `markdownlint-cli2` has released three new versions with bug fixes and new rules, or that `codespell` has added detection for a new category of typos.

Drift detection is the observability layer for our toolchain. It tells us when we're falling behind, so we can update deliberately rather than being surprised by breakage.

## What To Do

### 1. Create a Version Check Script

Create `scripts/check-versions.sh` that:

- Parses the Dockerfile to extract pinned versions
- Queries the npm registry for the latest `markdownlint-cli2` version
- Queries PyPI for the latest `codespell` version
- Compares pinned vs. latest
- Reports drift in a clear, actionable format
- Exits with code 0 if no drift, code 1 if drift detected

The script should output something like:

```
Checking tool versions...

markdownlint-cli2:
  Pinned:  0.22.1
  Latest:  0.22.1
  Status:  ✓ Up to date

codespell:
  Pinned:  2.4.2
  Latest:  2.5.0
  Status:  ✗ Outdated (0.6.0 behind)

Action required: Update codespell to 2.5.0 in Dockerfile
```

### 2. Implementation Approach

Use `curl` to query package registries:

```bash
# npm registry
curl -s https://registry.npmjs.org/markdownlint-cli2/latest | jq -r .version

# PyPI
curl -s https://pypi.org/pypi/codespell/json | jq -r .info.version
```

Parse the Dockerfile with `grep` and `sed`:

```bash
# Extract markdownlint-cli2 version
grep 'markdownlint-cli2@' Dockerfile | sed 's/.*@\(.*\)/\1/'

# Extract codespell version
grep 'codespell==' Dockerfile | sed 's/.*==\(.*\)/\1/'
```

### 3. Add the Makefile Target

Add to `Makefile`:

```makefile
check-versions: build
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "./scripts/check-versions.sh"
```

### 4. Install jq in the Docker Image

The script needs `jq` to parse JSON. Add it to the Dockerfile:

```dockerfile
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        hunspell \
        hunspell-en-gb \
        python3-pip \
        python3-venv \
        jq \
    && rm -rf /var/lib/apt/lists/*
```

Pin the `jq` version in the comment (see Phase 2).

### 5. Make the Script Executable

```bash
chmod +x scripts/check-versions.sh
```

### 6. Test It

```bash
make check-versions
```

Verify it reports the current state correctly. If all versions are up to date, it should exit 0. If any are outdated, it should exit 1 and print clear instructions.

## Acceptance Criteria

Before renaming this file to `03-version-drift-detection_COMPLETED.md`, verify:

- [ ] `scripts/check-versions.sh` exists and is executable
- [ ] The script parses the Dockerfile to extract pinned versions
- [ ] The script queries npm and PyPI for latest versions
- [ ] The script compares pinned vs. latest and reports drift clearly
- [ ] The script exits 0 if no drift, exits 1 if drift detected
- [ ] `make check-versions` runs the script inside the container
- [ ] `jq` is installed in the Docker image (pinned version documented)
- [ ] Running `make check-versions` produces clear, actionable output
- [ ] The script handles network failures gracefully (curl errors, invalid JSON)
- [ ] `make lint` still passes (no regressions)

## Dependencies

- Phase 2 (Version Pinning) — need pinned versions to check against

## Estimated Time

30-45 minutes.
