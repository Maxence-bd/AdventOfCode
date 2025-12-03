#!/bin/bash

set -euo pipefail

FILE="day3_input"

if [[ ! -f "$FILE" ]]; then
    echo "Fichier '$FILE' introuvable" >&2
    exit 1
fi

total=0


max_joltage_k_number() {
    local s="$1"
    local k="$2"              # nombre de chiffres à garder
    local n=${#s}

    local result=""
    local start=0           # début de la fenêtre
    local need=$k           # chiffres restant à choisir

    while (( need > 0 )); do
        local max_digit=-1
        local max_pos=$start

        # dernier index possible pour ce choix
        local last_idx=$(( n - need ))

        # on cherche le max dans la fenêtre [start .. last_idx]
        local i d
        for (( i=start; i<=last_idx; i++ )); do
            d=${s:i:1}
            if (( d > max_digit )); then
                max_digit=$d
                max_pos=$i
            fi
        done

        # on ajoute ce chiffre au résultat
        result+="$max_digit"

        # la prochaine fenêtre commence après ce chiffre
        start=$(( max_pos + 1 ))

        (( need-- ))
    done

    echo "$result"
}


while IFS= read -r line; do
    (( total+=$(max_joltage_k_number $line 12) ))
done < "$FILE"

echo "Total : $total"

