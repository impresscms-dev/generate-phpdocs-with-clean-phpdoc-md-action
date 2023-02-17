#!/usr/bin/env bats

setup() {
     export DOCS_PATH=$(mktemp -d)
     export COPY_DATA_PATH=$(mktemp -d)
     export TMP_DATA_PATH=$(mktemp -d)
     export PHPDOCMD_FILE=$COPY_DATA_PATH/.phpdoc-md
     export CLASS_ROOT_NAMESPACE="DeveloperA\\PackageB\\"
     export PHP_CLASSES_FILTERED_FILE=$TMP_DATA_PATH/classes.lst

     cat > "$PHP_CLASSES_FILTERED_FILE" <<EOL
DeveloperA\\PackageB\\ClassC
DeveloperA\\PackageB\\ClassD
DeveloperA\\PackageB\\ClassE
EOL
}

tear() {
    rm -rf "$DOCS_PATH" || true
    rm -rf "$COPY_DATA_PATH" || true
    rm -rf "$TMP_DATA_PATH" || true
}

@test "config generator generates config" {
     $BATS_TEST_DIRNAME/../bin/generate-config.php \
        "$PHPDOCMD_FILE" \
        "$PHP_CLASSES_FILTERED_FILE" \
        "$CLASS_ROOT_NAMESPACE" \
        "$DOCS_PATH"

     [ -f "$PHPDOCMD_FILE" ] && [ -s "$PHPDOCMD_FILE" ]
}