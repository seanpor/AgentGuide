FROM node:22-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        hunspell \
        hunspell-en-gb \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g markdownlint-cli2

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir codespell

ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /workspace

ENTRYPOINT ["/bin/bash"]
