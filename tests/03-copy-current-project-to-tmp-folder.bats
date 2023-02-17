#!/usr/bin/env bats

setup() {
     export COPY_DATA_PATH=$(mktemp -d)
     export CURRENT_PATH=$(mktemp -d)
     export TMP_TEST_PATH=$(mktemp -d)

     pushd "$CURRENT_PATH"
        git clone --no-tags --quiet https://github.com/impresscms-dev/generate-php-project-classes-list-file-action.git .
     popd
}

tear() {
    rm -rf "$COPY_DATA_PATH" || true
    rm -rf "$CURRENT_PATH" || true
    rm -rf "$TMP_TEST_PATH" || true
}

@test "Copier finishes with exit status 0" {

    EXIT_CODE=0
    pushd $CURRENT_PATH
        $BATS_TEST_DIRNAME/../bin/copy-current-project-to-tmp-folder.sh
        EXIT_CODE=$?
    popd

    [ "$EXIT_CODE" == "0" ]
}

@test "Paths results are same" {

    pushd $CURRENT_PATH
        $BATS_TEST_DIRNAME/../bin/copy-current-project-to-tmp-folder.sh
    popd

    pushd "$CURRENT_PATH"
        find . -type f | cut -sd / -f 2- |  sort -k 2 > $TMP_TEST_PATH/dir1.lst
    popd
    pushd "$COPY_DATA_PATH"
        find . -type f | cut -sd / -f 2- | sort -k 2 > $TMP_TEST_PATH/dir2.lst
    popd

    diff $TMP_TEST_PATH/dir1.lst $TMP_TEST_PATH/dir2.lst
}