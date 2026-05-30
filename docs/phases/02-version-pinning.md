# Phase 2: Version Pinning

## Objective

Pin all tool versions in the Dockerfile to exact, known-good versions. This ensures that `make lint` produces identical results today, next week, and next year — regardless of when the Docker image is built.

## Why This Matters

From our guide, Section VIII (Advanced Verification):

> "It works on my machine" is the oldest joke in software engineering. It is also the most expensive.

Right now, our Dockerfile installs the latest versions of `markdownlint-cli2`, `codespell`, and system packages. If a new version of `markdownlint-cli2` introduces a breaking change or a new rule, `make lint` will suddenly fail for everyone — even though nothing in our code changed. This is environmental drift, and it's a production incident waiting to happen.

Version pinning eliminates this category of bugs. The environment in the Docker image is byte-for-byte identical every time it's built.

## What To Do

### 1. Pin the Base Image

Replace the `FROM node:22-slim` line with a pinned digest:

```dockerfile
FROM node:22-slim@sha256:<digest>
```

To find the current digest:

```bash
docker pull node:22-slim
docker inspect node:22-slim | grep -i sha256
```

Copy the full `sha256:...` value and use it in the `FROM` line. Add a comment above it documenting the tag and date:

```dockerfile
# node:22-slim as of 2026-05-30
FROM node:22-slim@sha256:7af03b14a13c8cdd38e45058fd957bf00a72bbe17feac43b1c15a689c029c732
```

### 2. Pin npm Packages

Replace `npm install -g markdownlint-cli2` with an exact version:

```dockerfile
RUN npm install -g markdownlint-cli2@0.22.1
```

To find the current installed version:

```bash
docker run --rm agentguide-lint:latest -c "markdownlint-cli2 --version"
```

### 3. Pin pip Packages

Replace `pip install --no-cache-dir codespell` with an exact version:

```dockerfile
RUN /opt/venv/bin/pip install --no-cache-dir codespell==2.4.2
```

To find the current installed version:

```bash
docker run --rm agentguide-lint:latest -c "codespell --version"
```

### 4. Pin apt Packages

This is harder on Debian because apt doesn't have a simple "install this exact version" syntax that works across builds. Instead, pin the base image (step 1) and document the apt package versions in a comment:

```dockerfile
# System packages (versions from Debian bookworm as of 2026-05-30):
#   hunspell 1.7.1-1
#   hunspell-en-gb 1:7.5.0-1
#   python3 3.11.2-1+b1
#   python3-pip 23.0.1+dfsg-1
#   python3-venv 3.11.2-1+b1
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        hunspell \
        hunspell-en-gb \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*
```

To find current versions:

```bash
docker run --rm agentguide-lint:latest -c "dpkg -l | grep -E 'hunspell|python3 '"
```

### 5. Rebuild and Test

```bash
make clean
make build
make lint
```

Verify that `make lint` still passes with the pinned versions.

## Acceptance Criteria

Before renaming this file to `02-version-pinning_COMPLETED.md`, verify:

- [ ] Dockerfile `FROM` line uses a pinned digest (`@sha256:...`)
- [ ] Dockerfile has a comment documenting the base image tag and date
- [ ] `markdownlint-cli2` is installed with an exact version (`@0.22.1`)
- [ ] `codespell` is installed with an exact version (`==2.4.2`)
- [ ] Dockerfile has a comment documenting apt package versions and date
- [ ] `make clean && make build && make lint` passes
- [ ] Running `make build` twice in a row produces no changes (idempotent)
- [ ] The Dockerfile contains no `latest` tags or unpinned package installs

## Dependencies

- Phase 1 (Foundation) — need `.gitignore` to avoid committing build caches

## Estimated Time

20-30 minutes.
