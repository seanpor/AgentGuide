#!/bin/bash
# Install pre-commit hooks for AgentGuide.
# Run this once after cloning the repository.
# Requires: gitleaks (installed via Docker image) or GitHub CLI

set -euo pipefail

HOOK_DIR=$(git rev-parse --git-dir)/hooks
HOOK_FILE="$HOOK_DIR/pre-commit"

cat > "$HOOK_FILE" << 'HOOK'
#!/bin/bash
# Pre-commit hook: check staged changes for secrets via gitleaks.
# Uses the same Docker image as the CI pipeline.

set -euo pipefail

IMAGE="agentguide-lint:latest"

# If the image is not built yet, build it
if ! docker image inspect "$IMAGE" &>/dev/null; then
    echo "Building lint image for secret check..."
    docker build -t "$IMAGE" -f Dockerfile . >/dev/null 2>&1
fi

docker run --rm -v "$(pwd):/workspace" "$IMAGE" \
    -c "gitleaks protect --staged -v"
HOOK

chmod +x "$HOOK_FILE"
echo "Installed pre-commit hook at $HOOK_FILE"
