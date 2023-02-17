#!/usr/bin/env bats

setup() {
    export COPY_DATA_PATH=$(mktemp -d)

    pushd "$COPY_DATA_PATH"  > /dev/null
        git clone --no-tags --quiet https://github.com/imponeer/log-data-output-decorator.git .
        ls -la
    popd > /dev/null
}

tear() {
    rm -rf "$COPY_DATA_PATH"
}

@test "Adding packages for generation docs" {
     $BATS_TEST_DIRNAME/../bin/add-composer-packages.sh
}