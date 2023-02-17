#!/usr/bin/env bats

setup_file() {
     export COPY_DATA_PATH=$(mktemp -d)
     export GENERATOR_TMP_FILES_PATH=$(mktemp -d)
}

tear_file() {
    rm -rf "$COPY_DATA_PATH" || true
    rm -rf "$GENERATOR_TMP_FILES_PATH" || true
}

@test "Deleting COPY_DATA_PATH" {
    $BATS_TEST_DIRNAME/../bin/delete-temp-folders.sh

    [ ! -d "$COPY_DATA_PATH" ]
}

@test "Deleting GENERATOR_TMP_FILES_PATH" {
    $BATS_TEST_DIRNAME/../bin/delete-temp-folders.sh

    [ ! -d "$GENERATOR_TMP_FILES_PATH" ]
}