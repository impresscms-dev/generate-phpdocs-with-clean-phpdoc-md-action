#!/usr/bin/env bash

set -e

rm -rf "$COPY_DATA_PATH" || true
mkdir -p "$COPY_DATA_PATH"
rm -rf "$GENERATOR_TMP_FILES_PATH" || true
mkdir -p "$GENERATOR_TMP_FILES_PATH"