#!/usr/bin/env bash

# Copyright (c) 2026, lapic-ufjf
# Licensed under The MIT License [see LICENSE for details]

set -euo pipefail

TOTAL_COUNT=0
MISSING_COUNT=0

EXPECTED_HEADER='/*
 * Copyright (c) 2026, lapic-ufjf
 * Licensed under The MIT License [see LICENSE for details]
 */'

echo "Checking copyright headers..."
echo "=========================================================="

while IFS= read -r file; do
    ((TOTAL_COUNT++))

    HEADER="$(head -n 4 "$file")"

    if [[ "$HEADER" != "$EXPECTED_HEADER" ]]; then
        echo "Missing or invalid header: $file"
        ((MISSING_COUNT++))
    fi
done < <(
    find . \
        \( \
            -path "*/node_modules" -o \
            -path "*/dist" -o \
            -path "*/build" -o \
            -path "*/coverage" -o \
            -path "*/.next" \
        \) -prune -o \
        -type f \
        \( \
            -name "*.js"  -o \
            -name "*.jsx" -o \
            -name "*.ts"  -o \
            -name "*.tsx" -o \
            -name "*.mjs" -o \
            -name "*.cjs" \
        \) \
        -print
)

echo "=========================================================="
echo "Files checked: $TOTAL_COUNT"
echo "Files with issues: $MISSING_COUNT"

if (( MISSING_COUNT > 0 )); then
    echo
    echo "Some files are missing the expected copyright header."
    echo "Run 'make add-copyright' to add the required header automatically."
    exit 1
fi

echo
echo "All source files contain the expected copyright header."