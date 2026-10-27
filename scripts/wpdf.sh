#!/usr/bin/env bash

set -u

dir="$HOME/Desktop"

while true; do
    entries=()
    labels=()

    # Add the parent-directory option unless we're at Desktop.
    if [[ "$dir" != "$HOME/Desktop" ]]; then
        entries+=("..")
        labels+=("[DIR] ..")
    fi

    # Read immediate child directories and PDFs.
    while IFS= read -r -d '' path; do
        entries+=("$path")

        if [[ -d "$path" ]]; then
            labels+=("[DIR] $(basename "$path")")
        else
            labels+=("[PDF] $(basename "$path")")
        fi
    done < <(
        find "$dir" -mindepth 1 -maxdepth 1 \
            \( -type d -o -type f -iname '*.pdf' \) \
            -print0 | sort -z
    )

    # Exit if the directory is empty or wmenu is cancelled.
    ((${#labels[@]})) || exit 0

    selection=$(
        printf '%s\n' "${labels[@]}" |
            wmenu -i -l 15 -p "$(basename "$dir")/ "
    ) || exit 0

    selected_index=-1

    for i in "${!labels[@]}"; do
        if [[ "${labels[i]}" == "$selection" ]]; then
            selected_index="$i"
            break
        fi
    done

    ((selected_index >= 0)) || continue

    selected="${entries[selected_index]}"

    if [[ "$selected" == ".." ]]; then
        dir="$(dirname "$dir")"
    elif [[ -d "$selected" ]]; then
        dir="$selected"
    elif [[ -f "$selected" ]]; then
        xdg-open "$selected" >/dev/null 2>&1 &
        exit 0
    fi
done
