#!/bin/bash

FILE="day2_input"

if [[ ! -f "$FILE" ]]; then
    echo "Fichier '$FILE' introuvable" >&2
    exit 1
fi

total=0

while read -r line; do
# Parsing fichier pour extraire séquence
    IFS=',' read -ra SEQS <<< "$line"
    for seq in "${SEQS[@]}"
    do
        #echo "Séquence :" "$seq"
        IFS='-' read -r -a var <<< "$seq"
        var1="${var[0]}"
        var2="${var[1]}"
        echo "borne inf : " "$var1" " borne supp" "$var2"

        # Parcourir séquence
        for i in $(seq $var1 $var2)
        do
            #echo $i
            size=${#i}
            moitie=$((size / 2))
            #echo "premiere partie chiffre " "${i:0:$moitie}" " Deuxième partie " "${i:$moitie}"
            if [[ "${i:0:$moitie}" = "${i:$moitie}" ]]; then
                #echo "pareil " "$i" " -> 1ere partie : " "${i:0:$moitie}" " Deuxieme partie : " "${i:$moitie}"
                ((total+=$i))
                echo $total
            fi
        done

    done
    echo $total

    # Tester si un chiffre est une séquence répétée deux fois
    # "couper" le chiffre en deux
    # Regarder si les deux chiffres sont exacts

done < "$FILE"
