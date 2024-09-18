# Bookmark Manager Function
bm() {
    local BOOKMARKS_FILE="$HOME/Documents/bookmarks"

    # Function to search bookmarks
    search_bookmarks() {
        local search_terms=("$@")
        local results=()

        while IFS=',' read -r url tags categories; do
            local match=true
            for term in "${search_terms[@]}"; do
                if [[ ! "$url $tags $categories" =~ $term ]]; then
                    match=false
                    break
                fi
            done
            if $match; then
                results+=("$url")
            fi
        done < "$BOOKMARKS_FILE"

        if (( ${#results} == 0 )); then
            echo "No matching bookmarks found."
        else
            print -l "${results[@]}"
        fi
    }

    # Main logic
    if (( $# == 0 )); then
        echo "Usage: bm <search terms>"
        return 1
    fi

    search_bookmarks "$@"
}
