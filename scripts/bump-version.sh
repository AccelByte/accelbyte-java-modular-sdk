#!/usr/bin/env bash

set -e
set -o pipefail

MODULE_NAME=$1
test -n "$MODULE_NAME" || (echo "MODULE_NAME is not set"; exit 1)

MODULE_NAME="module-$MODULE_NAME"

echo "Checking module: $MODULE_NAME..."

# count changed files based in specified module directory with git diff
CHANGE_COUNT=$(git diff --name-only | { grep -c "$MODULE_NAME" || test $? = 1; } | { grep -v grep || test $? = 1; })
if [ "$CHANGE_COUNT" -gt 0 ]; then
    echo -e "\t Changes count for $MODULE_NAME: $CHANGE_COUNT"
    LAST_VERSION=$(head -n1 "$MODULE_NAME/build.gradle" | awk -F"['\"]" '{print $2}')
    echo -e "\t Last version: $LAST_VERSION"

    # bump minor version only
    NEW_VERSION=$(echo "$LAST_VERSION" | awk -v part=2 -F . '{OFS="."; $part+=1; print $0}')
    echo -e "\t New version: $NEW_VERSION"

    # update version in build.gradle file for specified module
    find "$MODULE_NAME" -type f -name 'build.gradle' -exec awk -i inplace -v newVersion="$NEW_VERSION" '
      /^version\s*=\s*/ {
        sub(/version\s*=\s*.*/, "version = \x27" newVersion "\x27")
      }
      { print }
    ' {} +

    # update version in ModuleInfo.java
    find "$MODULE_NAME" -type f -name 'ModuleInfo.java' -exec awk -i inplace -v newVersion="$NEW_VERSION" '
      /public String getVersion\(\)/, /return/ {
        if (/return/) sub(/"[^"]*"/, "\"" newVersion "\"")
      }
      { print }
    ' {} +

    # update version in version.txt
    echo "$NEW_VERSION" > "$MODULE_NAME/version.txt"

else
    echo -e "\t No changes"    
fi

