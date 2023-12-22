#!/usr/bin/env bash

set -e
set -o pipefail

AGS_VERSION=$1
test -n "$AGS_VERSION" || (echo "AGS_VERSION is not set"; exit 1)

# Format the modules for the Gradle command
GRADLE_MODULES=""

MODULES=$(git tag --contains $(git rev-list -n 1 "ags/v$AGS_VERSION") | grep -v "ags/v$AGS_VERSION")
for MODULE in $MODULES; do
    MODULE_NAME=$(echo "$MODULE" | cut -f1 -d'/')
    GRADLE_MODULES+=":$MODULE_NAME:publishToSonatype "
done

echo "$GRADLE_MODULES"