#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/docs/diagrams/png"
for f in "$ROOT"/docs/diagrams/src/*.dot; do
  base="$(basename "$f" .dot)"
  dot -Tsvg "$f" -o "$ROOT/docs/diagrams/${base}.svg"
  dot -Tpng -Gdpi=120 "$f" -o "$ROOT/docs/diagrams/png/${base}.png"
done
