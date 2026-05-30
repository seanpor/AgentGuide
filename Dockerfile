# node:22-slim as of 2026-05-30
FROM node:22-slim@sha256:7af03b14a13c8cdd38e45058fd957bf00a72bbe17feac43b1c15a689c029c732

# System packages (versions from Debian bookworm as of 2026-05-30):
#   curl 7.88.1-10+deb12u14
#   hunspell 1.7.1-1
#   hunspell-en-gb 1:7.5.0-1
#   jq 1.6-2.1+deb12u1
#   python3 3.11.2-1+b1
#   python3-pip 23.0.1+dfsg-1
#   python3-venv 3.11.2-1+b1
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        hunspell \
        hunspell-en-gb \
        jq \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g markdownlint-cli2@0.22.1

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir codespell==2.4.2

ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /workspace

ENTRYPOINT ["/bin/bash"]
