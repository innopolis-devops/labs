#!/bin/sh
# Ported from https://github.com/haskell/stylish-haskell/blob/main/scripts/latest.sh

set -e

PACKAGE=stylish-haskell
echo Downloading $PACKAGE...

VERSION_REGEX="v\d+\.\d+\.\d+(\.\d+)?"

RELEASES=$(curl --silent https://github.com/haskell/$PACKAGE/releases)
RELEASE_URL=https://github.com/$(echo "$RELEASES" | grep -Po "haskell/$PACKAGE/releases/tag/$VERSION_REGEX" | head -n1)
VERSION=$(echo "$RELEASE_URL" | grep -Po "$VERSION_REGEX")
DOWNLOAD_URL="https://github.com/haskell/$PACKAGE/releases/download/$VERSION/stylish-haskell-$VERSION-linux-x86_64.tar.gz"
TEMP=$(mktemp --directory .$PACKAGE-XXXXX)

cleanup(){
    rm -r "$TEMP"
}
trap cleanup EXIT

curl --progress-bar --location -o"$TEMP/$PACKAGE.tar.gz" "$DOWNLOAD_URL"
tar -xzf "$TEMP/$PACKAGE.tar.gz" -C"$TEMP"
mv "$TEMP/$PACKAGE-$VERSION-linux-x86_64/$PACKAGE" .
