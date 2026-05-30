.PHONY: lint lint-md lint-spell build clean

IMAGE_NAME := agentguide-lint
IMAGE_TAG := latest

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

lint: lint-md lint-spell

lint-md: build
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "markdownlint-cli2 '**/*.md' '#node_modules'"

lint-spell: build
	docker run --rm -v $(PWD):/workspace $(IMAGE_NAME):$(IMAGE_TAG) \
		-c "codespell --builtin clear,rare,informal,usage,code,names *.md && \
		    hunspell -d en_GB -p .hunspell_en_GB -l *.md | sort -u"

clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) 2>/dev/null || true
