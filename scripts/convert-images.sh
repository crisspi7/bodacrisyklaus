#!/usr/bin/env bash
set -euo pipefail
# Usage: place your original hero.jpg in assets/hero.jpg and run this script from the repo root:
# chmod +x scripts/convert-images.sh
# ./scripts/convert-images.sh
SRC="assets/hero.jpg"
OUTDIR="assets"
Q=80
if [ ! -f "$SRC" ]; then
  echo "Error: $SRC not found. Please add your original photo to $SRC and re-run."
  exit 1
fi
command -v cwebp >/dev/null 2>&1 || { echo "cwebp not found. Install libwebp (cwebp) or edit this script to use imagemagick's convert."; exit 1; }
cwebp -q $Q "$SRC" -resize 0 480 -o "$OUTDIR/hero-480.webp"
cwebp -q $Q "$SRC" -resize 0 800 -o "$OUTDIR/hero-800.webp"
cwebp -q $Q "$SRC" -resize 0 1200 -o "$OUTDIR/hero-1200.webp"
if command -v convert >/dev/null 2>&1; then
  convert "$SRC" -resize x1200 -strip -interlace Plane -quality 82 "$OUTDIR/hero-1200.jpg"
  convert "$SRC" -resize x800 -strip -interlace Plane -quality 82 "$OUTDIR/hero-800.jpg"
  convert "$SRC" -resize x480 -strip -interlace Plane -quality 82 "$OUTDIR/hero-480.jpg"
fi
echo "Generated: $OUTDIR/hero-480.webp, hero-800.webp, hero-1200.webp (and JPG fallbacks if imagemagick is present)."
