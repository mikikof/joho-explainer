#!/usr/bin/env bash
# 開発正本(my-company/.company/media/webツール/情報)から配布リポへ解説ツールを再同期する。
# 使い方: ./sync_from_dev.sh  → その後 git add/commit/push
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEV="/Users/mikiokofune/my-company/.company/media/webツール/情報"
[[ -d "$DEV" ]] || { echo "ERROR: dev source not found: $DEV" >&2; exit 1; }
for f in sampling-theorem.html color-digitization.html image-resolution.html compression.html; do
  cp "$DEV/$f" "$ROOT/$f"
  echo "synced: $f"
done
find "$ROOT" -name ".DS_Store" -delete
echo "OK. 新ツールを足したら index.html のカードと、この配列にも追記すること。"
