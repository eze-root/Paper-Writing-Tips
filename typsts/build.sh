#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
OUTPUT_DIR="${SLIDES_OUT_DIR:-$PROJECT_ROOT/build/slides}"
TYPST_BIN="${TYPST_BIN:-typst}"
TOUYING_BIN="${TOUYING_BIN:-touying}"
SOURCE_FILE="$PROJECT_ROOT/typsts/main.typ"
FONT_DIR="$PROJECT_ROOT/typsts/fonts"

mkdir -p "$OUTPUT_DIR"

"$TYPST_BIN" compile \
  "$SOURCE_FILE" \
  "$OUTPUT_DIR/paper-writing-tips.pdf" \
  --root "$PROJECT_ROOT" \
  --font-path "$FONT_DIR"

"$TOUYING_BIN" compile \
  "$SOURCE_FILE" \
  --root "$PROJECT_ROOT" \
  --output "$OUTPUT_DIR/index.html" \
  --format html \
  --font-paths "$FONT_DIR"

"$TOUYING_BIN" compile \
  "$SOURCE_FILE" \
  --root "$PROJECT_ROOT" \
  --output "$OUTPUT_DIR/paper-writing-tips.pptx" \
  --format pptx \
  --font-paths "$FONT_DIR"

printf 'Slides built in %s\n' "$OUTPUT_DIR"
