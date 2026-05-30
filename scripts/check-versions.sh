#!/bin/bash
set -euo pipefail

echo "Checking tool versions..."
echo ""

DRIFT_FOUND=0
NETWORK_ERROR=0

PINNED_MARKDOWNLINT=$(grep 'markdownlint-cli2@' Dockerfile | sed 's/.*@\(.*\)/\1/')
PINNED_CODESPELL=$(grep 'codespell==' Dockerfile | sed 's/.*==\(.*\)/\1/')

LATEST_MARKDOWNLINT=$(curl -sf https://registry.npmjs.org/markdownlint-cli2/latest | jq -r '.version' 2>/dev/null) || LATEST_MARKDOWNLINT=""
LATEST_CODESPELL=$(curl -sf https://pypi.org/pypi/codespell/json | jq -r '.info.version' 2>/dev/null) || LATEST_CODESPELL=""

echo "markdownlint-cli2:"
echo "  Pinned:  ${PINNED_MARKDOWNLINT}"
if [ -z "$LATEST_MARKDOWNLINT" ]; then
  echo "  Latest:  (unable to query)"
  echo "  Status:  ? Network error or registry unavailable"
  NETWORK_ERROR=1
else
  echo "  Latest:  ${LATEST_MARKDOWNLINT}"
  if [ "$PINNED_MARKDOWNLINT" = "$LATEST_MARKDOWNLINT" ]; then
    echo "  Status:  Up to date"
  else
    echo "  Status:  Outdated"
    echo ""
    echo "Action required: Update markdownlint-cli2 to ${LATEST_MARKDOWNLINT} in Dockerfile"
    DRIFT_FOUND=1
  fi
fi

echo ""
echo "codespell:"
echo "  Pinned:  ${PINNED_CODESPELL}"
if [ -z "$LATEST_CODESPELL" ]; then
  echo "  Latest:  (unable to query)"
  echo "  Status:  ? Network error or registry unavailable"
  NETWORK_ERROR=1
else
  echo "  Latest:  ${LATEST_CODESPELL}"
  if [ "$PINNED_CODESPELL" = "$LATEST_CODESPELL" ]; then
    echo "  Status:  Up to date"
  else
    echo "  Status:  Outdated"
    echo ""
    echo "Action required: Update codespell to ${LATEST_CODESPELL} in Dockerfile"
    DRIFT_FOUND=1
  fi
fi

echo ""
if [ "$DRIFT_FOUND" -eq 1 ]; then
  exit 1
fi

if [ "$NETWORK_ERROR" -eq 1 ]; then
  echo "Warning: Could not verify all versions due to network issues."
  exit 0
fi

echo "All tools are up to date."
exit 0
