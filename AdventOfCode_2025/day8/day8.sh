#!/usr/bin/env bash

set -euo pipefail

FILE="${1:-day8_input}"

if [[ ! -f "$FILE" ]]; then
    echo "Fichier '$FILE' introuvable" >&2
    exit 1
fi

# Nombre total de boîtes
total_points=$(wc -l < "$FILE")
