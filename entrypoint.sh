#!/bin/bash -l
set -uxo pipefail

OUTPUT=${OUTPUT:="$GITHUB_REPOSITORY/CHANGELOG.md"}

# Create the output directory
mkdir -p "$(dirname $OUTPUT)"

# Execute git-cliff
GIT_CLIFF_OUTPUT="$OUTPUT" git-cliff $@
exit_code=$?

# Output to console
cat "$OUTPUT"

# Set output file
echo "::set-output name=changelog::$OUTPUT"

# Pass exit code to the next step
echo "::set-output name=exit_code::$exit_code"
