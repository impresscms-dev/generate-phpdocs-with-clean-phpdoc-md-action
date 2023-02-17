#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

CURRENT_CMD=$(
cat <<EOF
  composer require \
    $("$SCRIPT_DIR"/get-composer-dependencies.php) \
    --no-plugins \
    --ignore-platform-reqs \
    --no-scripts \
    --working-dir=$COPY_DATA_PATH
EOF
);

$CURRENT_CMD