#!/usr/bin/env bash
# 開発正本(my-company/.company/media/webツール/情報)から配布リポへ解説ツールを再同期する。
# 使い方: ./sync_from_dev.sh  → その後 git add/commit/push
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEV="/Users/mikiokofune/my-company/.company/media/webツール/情報"
[[ -d "$DEV" ]] || { echo "ERROR: dev source not found: $DEV" >&2; exit 1; }
# 末尾が / のものは複数ページのシリーズ（ディレクトリ）。解説ツールは順にこの形へ移る。
# 旧 1 ファイル版は、ハブ index のカードを差し替えるまで残す（消すとリンクが切れる）。
for f in sampling-theorem.html color-digitization.html image-resolution.html compression.html os-abstraction/ complement-subtraction/ logic-gates/ instruction-execution/ loop-range/ array-index-trace/ binary-search/ update-order/ queue-start-time/; do
  if [[ "$f" == */ ]]; then
    d="${f%/}"
    # 消す先を取り違えないための歯止め（空・スラッシュ入り・..  を拒む）
    [[ -n "$d" && "$d" != *"/"* && "$d" != ".." ]] || { echo "ERROR: 不正なディレクトリ名: $f" >&2; exit 1; }
    [[ -d "$DEV/$d" ]] || { echo "ERROR: 正本が無い: $DEV/$d" >&2; exit 1; }
    rm -rf "${ROOT:?}/$d"
    cp -R "$DEV/$d" "$ROOT/$d"
    # _src は生成器の入力。公開するのは対話型ツールそのものだけ（内部資料は出さない）。
    rm -rf "${ROOT:?}/$d/_src"
    echo "synced: $d/ （$(ls -1 "$ROOT/$d" | wc -l | tr -d ' ') ファイル）"
  else
    cp "$DEV/$f" "$ROOT/$f"
    echo "synced: $f"
  fi
done
find "$ROOT" -name ".DS_Store" -delete
echo "OK. 新ツールを足したら index.html のカードと、この配列にも追記すること。"
