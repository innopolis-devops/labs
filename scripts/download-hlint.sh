#!/bin/bash

set -o nounset
set -o errexit

name="hlint"
dst="$HOME/.local/bin"
exe="$dst/$name"

mkdir -p "$dst"

os=linux
url=$(curl -sSL https://api.github.com/repos/ndmitchell/hlint/releases/latest | jq -r ".assets[] | select(.name | test(\"$os\")) | .browser_download_url")

echo "Downloading $url"

curl -sSL "$url" | gunzip > "$exe.tmp"
chmod +x "$exe.tmp"
mv "$exe.tmp" "$exe"

echo "Installed $name to $exe"
