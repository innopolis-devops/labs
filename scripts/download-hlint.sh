#!/bin/bash

set -o nounset
set -o errexit

name="hlint"
dst="$HOME/.local/bin"

mkdir -p "$dst"

os=linux
api_response=$(curl -sSL https://api.github.com/repos/ndmitchell/$name/releases/latest)
url=$(echo "$api_response" | jq -r ".assets[] | select(.name | test(\"$os\")) | .browser_download_url")

tag_name=$(echo "$api_response" | jq ".tag_name")
version=$(echo "$tag_name" | sed 's/v//' | sed 's/"//g')

echo "Downloading $url"

curl -sSL "$url" > "$name.tar.gz"
tar -xzf "$name.tar.gz"

chmod +x "$name-$version/$name"
mv "$name-$version/$name" "$dst"

echo "Installed $name to $dst/$name"
