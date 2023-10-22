#! /bin/bash

# Fonction pour comparer deux fichiers
function compare_files() {
    # Calcul de l'empreinte numérique des deux fichiers
    file1_hash=$(sha1sum "$1")
    file2_hash=$(sha1sum "$2")

    # Comparaison des empreintes numériques
    return $(echo "$file1_hash" == "$file2_hash" | bc)
}

# Fonction pour supprimer un fichier en double
function remove_duplicate() {
    # Chemin du fichier à supprimer
    file_path="$1"

    # Affichage d'une confirmation
    echo "Suppression du fichier en double : $file_path"

    # Suppression du fichier
    rm "$file_path"
}

# Récupération de la liste des fichiers
files=$(dir "$PWD")

# Boucle sur les fichiers
for file in $files; do
    # Vérification si le fichier est un dossier
    if [ -d "$file" ]; then
        # Continuation de la boucle
        continue
    fi

    # Boucle sur les autres fichiers
    for other_file in $files; do
        # Vérification si les deux fichiers sont différents
        if [ "$file" != "$other_file" ]; then
            # Comparaison des deux fichiers
            is_duplicate=$(compare_files "$file" "$other_file")

            # Si les deux fichiers sont en double, suppression du fichier en double
            if [ "$is_duplicate" -eq 0 ]; then
                remove_duplicate "$other_file"
            fi
        fi
    done
done
