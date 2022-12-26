# 概要
macOS/Ubuntuにオレオレ開発環境を構築するdotfiles

# インストール
1. ~/dotfilesにこのフォルダを移動
2. コマンド実行
```bash
./install.sh
```

# 設計思想
resources配下は設定ファイルのリソース。シンボリックリンクによってすべての設定はここに紐づく。
環境固有の設定は*.local.shに置く。
特に環境固有のユーザー設定はuser.local.shに書くようにする。
src/install配下はインストーラ。破壊的な変更を行う処理はここに書く。

# 個人向けオプション
個人向けオプションを含める場合は決して共有しないでください。
## .gitconfig
1. `resources/.gitconfig`を用意
2. `personal_options.sh`の下記コメントを解除
```bash
#. ${SCRIPT_DIR}/src/install/.gitconfig/install.sh
```

# 組織向けオプション
組織向けオプションを含める場合は共有範囲に注意し、組織外に漏れることがないよう細心の注意を払ってください。
## 作成中
x. `organization_options.sh`の下記コメントを解除
```bash
#
```