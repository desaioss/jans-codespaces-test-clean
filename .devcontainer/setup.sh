#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/../docs"

# Keep Poetry separate from the project's dependencies.
python -m venv "$HOME/.local/share/jans-docs-poetry"
"$HOME/.local/share/jans-docs-poetry/bin/python" -m pip install poetry

mkdir -p "$HOME/.local/bin"
ln -sfn \
  "$HOME/.local/share/jans-docs-poetry/bin/poetry" \
  "$HOME/.local/bin/poetry"

export PATH="$HOME/.local/bin:$PATH"

poetry install --no-root

echo "Documentation dependencies are ready."