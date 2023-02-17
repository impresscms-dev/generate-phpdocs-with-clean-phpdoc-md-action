#!/usr/bin/env bats

@test "COPY_DATA_PATH var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$COPY_DATA_PATH" ];
}

@test "GENERATOR_TMP_FILES_PATH var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$GENERATOR_TMP_FILES_PATH" ];
}

@test "RULES_FILE var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$RULES_FILE" ];
}

@test "PHP_CLASSES_ORIG_FILE var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$PHP_CLASSES_ORIG_FILE" ];
}

@test "PHP_CLASSES_FILTERED_FILE var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$PHP_CLASSES_FILTERED_FILE" ];
}

@test "ACTION_BIN_PATH var exists" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    [ ! -z "$ACTION_BIN_PATH" ];
}

@test "ACTION_BIN_PATH is correct" {
    eval $("$BATS_TEST_DIRNAME/../bin/generate-env.sh" test1 test2)
    NORMALIZED_PATH_1=$(realpath "$ACTION_BIN_PATH")
    NORMALIZED_PATH_2=$(realpath "$BATS_TEST_DIRNAME/../bin")

    [ "$NORMALIZED_PATH_1" == "$NORMALIZED_PATH_2" ];
}