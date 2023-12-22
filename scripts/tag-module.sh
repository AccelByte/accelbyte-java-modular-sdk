#!/usr/bin/env bash

set -e
set -o pipefail

MODULE_NAME=$1
test -n "$MODULE_NAME" || (echo "MODULE_NAME is not set"; exit 1)

MODULE_NAME="module-$MODULE_NAME"
LAST_TAG=$(git tag --list "$MODULE_NAME/*" --sort -version:refname | tail -n 1)
LAST_COMMIT=$(git log --format="%H" -n 1)

CHANGE_COUNT=$(git diff --name-only "$LAST_TAG" | { grep -c "$MODULE_NAME/version.txt" || test $? = 1; } | { grep -v grep || test $? = 1; })
if [ "$CHANGE_COUNT" -gt 0 ]; then
    echo "Tagging $MODULE_NAME..."

    VERSION_INFO=$(cat "$MODULE_NAME/version.txt" | tail -n 1)
    echo -e "\t New version: $VERSION_INFO"

    NEW_TAG="$MODULE_NAME/v$VERSION_INFO"
    echo -e "\t New tag: $NEW_TAG"

    git tag "$NEW_TAG" "$LAST_COMMIT"
fi