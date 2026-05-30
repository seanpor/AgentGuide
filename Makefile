.PHONY: default lint lint-md lint-spell build clean check-versions

IMAGE_NAME := agentguide-lint
IMAGE_TAG := latest
STAMP_FILE := .docker-build-stamp

default:
	@echo "Available targets:"
	@echo "  make build          Build the lint Docker image"
	@echo "  make lint           Run all lint checks (markdown + spelling)"
	@echo "  make lint-md        Run markdown linting only"
	@echo "  make lint-spell     Run spelling checks only"
	@echo "  make check-versions Check tool version drift"
	@echo "  make clean          Remove the built Docker image"

build: $(STAMP_FILE)

$(STAMP_FILE): Dockerfile
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	touch $(STAMP_FILE)

lint: lint-md lint-spell lint-secrets

lint-secrets: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "gitleaks dir . -v"

lint-md: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "markdownlint-cli2 '**/*.md' '#node_modules'"

lint-spell: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "codespell --builtin clear,rare,informal,usage,code,names *.md && \
		    hunspell -d en_GB -p .hunspell_en_GB -l *.md | sort -u"

check-versions: $(STAMP_FILE)
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "./scripts/check-versions.sh"

clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) 2>/dev/null || true
	rm -f $(STAMP_FILE)
