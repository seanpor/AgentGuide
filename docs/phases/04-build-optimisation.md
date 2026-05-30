# Phase 4: Build Optimisation

## Objective

Optimise the Docker build process so that `make lint` only rebuilds the image when the Dockerfile has changed. This reduces build time from ~20 seconds to ~0.5 seconds for unchanged builds.

## Why This Matters

From our guide, Section X (Cognitive Routing and Economics):

> Every token in the context window is billed.

The same principle applies to Docker builds. Every time you run `make lint`, the current Makefile triggers a `docker build`. Even with Docker's layer caching, this takes 5-20 seconds to check all layers. Over a day of development, that's minutes of wasted time and CPU cycles.

A stamp file pattern — common in Makefiles since the 1970s — solves this. The build target only runs when the Dockerfile is newer than the stamp file. If nothing has changed, the build is skipped entirely.

## What To Do

### 1. Update the Makefile

Replace the current `build` target with a stamp-file-based approach:

```makefile
STAMP_FILE := .docker-build-stamp

build: $(STAMP_FILE)

$(STAMP_FILE): Dockerfile
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	touch $(STAMP_FILE)
```

This tells Make: "The stamp file depends on the Dockerfile. If the Dockerfile is newer than the stamp file (or the stamp file doesn't exist), rebuild the image and touch the stamp file."

### 2. Update the Clean Target

Add the stamp file to the clean target:

```makefile
clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) 2>/dev/null || true
	rm -f $(STAMP_FILE)
```

### 3. Update Lint Targets

The lint targets should depend on the stamp file, not the build target:

```makefile
lint-md: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "markdownlint-cli2 '**/*.md' '#node_modules'"

lint-spell: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "codespell --builtin clear,rare,informal,usage,code,names *.md && \
		    hunspell -d en_GB -p .hunspell_en_GB -l *.md | sort -u"
```

### 4. Add Stamp File to .gitignore

Add `.docker-build-stamp` to `.gitignore`:

```
# Build artefacts
*.log
.docker-build-stamp
```

### 5. Test the Optimisation

Run these commands and observe the timing:

```bash
# First run: should build the image (~20 seconds)
time make lint

# Second run: should skip the build (~0.5 seconds)
time make lint

# After modifying Dockerfile: should rebuild (~20 seconds)
touch Dockerfile
time make lint

# After clean: should rebuild (~20 seconds)
make clean
time make lint
```

## Acceptance Criteria

Before renaming this file to `04-build-optimisation_COMPLETED.md`, verify:

- [ ] `.docker-build-stamp` file is created after a successful build
- [ ] `.docker-build-stamp` is in `.gitignore`
- [ ] Running `make lint` twice in a row without changes skips the Docker build (second run <1 second)
- [ ] Modifying the Dockerfile triggers a rebuild on the next `make lint`
- [ ] Running `make clean` removes the stamp file and the Docker image
- [ ] Running `make lint` after `make clean` rebuilds the image
- [ ] `make lint` still passes (no regressions)
- [ ] The Makefile uses standard Make dependency syntax (no shell conditionals)

## Dependencies

- Phase 1 (Foundation) — need `.gitignore` to exclude the stamp file

## Estimated Time

15-20 minutes.
