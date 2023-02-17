#!/usr/bin/env bats

@test "composer.json exists" {
    [ -f "$BATS_TEST_DIRNAME/../composer.json" ]
}

@test "get-composer-dependencies.php runs" {
    $BATS_TEST_DIRNAME/../bin/get-composer-dependencies.php
}

@test "get-composer-dependencies.php returns output" {
    RET=$($BATS_TEST_DIRNAME/../bin/get-composer-dependencies.php)
    [ ! -z "$RET" ]
}