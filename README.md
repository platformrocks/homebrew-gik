# homebrew-gik

Official Homebrew tap for **GIK** (Guided Indexing Kernel) — a local-first knowledge engine for software projects.

## What is GIK?

GIK tracks the evolution of knowledge in codebases, similar to how Git tracks files. It provides:
- **RAG (Retrieval-Augmented Generation)** – Semantic search over code and docs
- **Knowledge Graph** – Entities and relationships
- **Memory** – Events, decisions, and rationales
- **Stack Inventory** – Project structure analysis

## Installation

### Tap and Install

```bash
brew tap platformrocks/gik
brew install gik
```

Or install directly:

```bash
brew install platformrocks/gik/gik
```

### Verify Installation

```bash
gik --version
```

## Quick Start

```bash
# Initialize GIK in your project
gik init

# Stage files for indexing
gik add src/

# Commit to create knowledge revision
gik commit -m "Initial knowledge index"

# Query your codebase
gik ask "How does authentication work?"
```

## Distribution

This tap installs **prebuilt binaries** from [GitHub Releases](https://github.com/platformrocks/osr.gik/releases).

Each release artifact includes:
- `bin/gik` – The GIK CLI binary
- `models/` – Embedding and reranker models
- `config.default.yaml` – Default configuration

## Main Project

The GIK CLI source code and releases are maintained at:
- **Repository**: [platformrocks/osr.gik](https://github.com/platformrocks/osr.gik)
- **Documentation**: [README](https://github.com/platformrocks/osr.gik/blob/main/README.md)
- **Issues**: [GitHub Issues](https://github.com/platformrocks/osr.gik/issues)

## Updating the Formula

### For Maintainers

When a new version is released:

1. Update `version` in `Formula/gik.rb`
2. Update all URLs to point to the new release tag (e.g., `v0.2.0`)
3. Download each artifact and compute SHA256:
   ```bash
   shasum -a 256 gik-macos-aarch64.tar.gz
   shasum -a 256 gik-macos-x86_64.tar.gz
   shasum -a 256 gik-linux-x86_64.tar.gz
   ```
4. Update the `sha256` values in the formula
5. Test locally:
   ```bash
   brew install --build-from-source Formula/gik.rb
   brew test gik
   brew audit --strict --online gik
   ```
6. Commit and push changes

## License

MIT © 2025 PLATFORM ROCKS LTDA
