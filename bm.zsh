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

    # Function to add a new bookmark
    add_bookmark() {
        local url="$1"
        shift
        local tags=""
        local categories=""
        local in_categories=false

        for arg in "$@"; do
            if [[ "$arg" == "::" ]]; then
                in_categories=true
                continue
            fi

            if $in_categories; then
                categories+="$arg "
            else
                tags+="$arg "
            fi
        done

        tags=${tags% }  # Remove trailing space
        categories=${categories% }  # Remove trailing space

        echo "$url , $tags , $categories" >> "$BOOKMARKS_FILE"
        echo "Bookmark added successfully."
    }

    # Main logic
    if (( $# == 0 )); then
        echo "Usage: bm <search terms>"
        echo "       bm add <url> <tag1> <tag2> ... :: <category1> <category2> ..."
        return 1
    fi

    if [[ "$1" == "add" ]]; then
        if (( $# < 3 )); then
            echo "Usage: bm add <url> <tag1> <tag2> ... :: <category1> <category2> ..."
            return 1
        fi
        shift  # Remove 'add' from arguments
        add_bookmark "$@"
    else
        search_bookmarks "$@"
    fi
}
