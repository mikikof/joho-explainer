# 情報 解説ツール（joho-explainer）

高校情報Ⅰ向けの対話型 解説Webツールの配布リポジトリ。GitHub Pages で公開。

- 公開URL: https://mikikof.github.io/joho-explainer/
- 各ツールは外部依存ゼロの単一HTML（CDN・ライブラリ不使用）。

## 収録
- `sampling-theorem.html` … 標本化定理
- `color-digitization.html` … 色のデジタル化（RGB・ビット深度・階調）
- `image-resolution.html` … 画像の解像度（画素・データ量）
- `compression.html` … データ圧縮（可逆＝ランレングス・ハフマン／非可逆＝写真JPEG・音MP3・拡張子）

## 更新
開発正本は my-company（private）の `.company/media/webツール/情報/`。
編集はそちらで行い、`./sync_from_dev.sh` でこの配布リポへ反映 → commit & push。
配布リポは Pages で即時公開されるため、push 前に http で実機確認すること。
