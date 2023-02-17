#!/usr/bin/env bats

setup() {
     export COPY_DATA_PATH=$(mktemp -d)
     export GENERATOR_TMP_FILES_PATH=$(mktemp -d)
}

tear() {
    rm -rf "$COPY_DATA_PATH" || true
    rm -rf "$GENERATOR_TMP_FILES_PATH" || true
}

@test "Creating COPY_DATA_PATH if needed" {
    $BATS_TEST_DIRNAME/../bin/create-temp-folders.sh

    [ -d "$COPY_DATA_PATH" ]
}

@test "Creating GENERATOR_TMP_FILES_PATH if needed" {
    $BATS_TEST_DIRNAME/../bin/create-temp-folders.sh

    [ -d "$GENERATOR_TMP_FILES_PATH" ]
}