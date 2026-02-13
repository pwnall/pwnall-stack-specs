---
name: pwnall-stack-specs
description: Development standards and technical stack specifications. MANDATORY for planning and executing project tasks.
---

# Project Stack Specifications

Ensure the project environment and code comply with the following standards.

## Core Technologies

* [Python / uv](references/environment-python.md)
* [Node.js / nvm](references/environment-node.md)
* [Homebrew](references/environment-homebrew.md)
* [Git](references/environment-git.md)

## Domain Specifications

Consult these guides when working in specific technical areas:

* **API / Backend**: [API serving stack](references/api-serving.md)
* **AI / ML**:
    * [Language model system prompt](references/lm-system-prompt.md)
    * [Image detection inference](references/image-detection.md)
    * [Document OCR](references/document-ocr.md)
* **Data & Storage**:
    * [Storage](references/storage.md)
    * [Semantic search](references/semantic-search.md)
* **Tools**:
    * [Image manipulation](references/image-manipulation.md)
    * [JupyterLab notebooks](references/jupyter.md)

# Environment Setup

If the core technologies below are missing, offer to run the following scripts.

* [Install core technologies](scripts/environment-install-deps.sh)
* [Set shell environment variables](scripts/environment-bash-profile.sh)
