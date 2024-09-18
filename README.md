# Terminal Bookmark Manager

A simple and efficient bookmark manager for the command line.

## Features

- Search bookmarks using multiple terms
- Matches against URLs, tags, and categories
- Easy to use and integrate into your workflow

## Installation

1. Copy the `bm()` function into your `.zshrc` file or a separate script that you source in your `.zshrc`.
2. Create a file named `bookmarks` in your `~/Documents/` directory.
3. Restart your terminal or source your `.zshrc` file.

## Usage

To search for bookmarks, use the `bm` command followed by one or more search terms:

```
bm <search term1> <search term2> ...
```

The search will match against URLs, tags, and categories.

## Bookmark File Format

The bookmark file should be located at `~/Documents/bookmarks` and follow this format:

```
url, tags, categories
```

Example:
```
github.com, code repository, programming
stackoverflow.com, q&a, programming
medium.com, blog, writing
spotify.com, music, streaming
netflix.com, video, streaming
```

## Examples

1. Search for bookmarks related to "programming":
   ```
   $ bm programming
   github.com
   stackoverflow.com
   ```

2. Find bookmarks about "streaming":
   ```
   $ bm streaming
   spotify.com
   netflix.com
   ```

## Notes

- The search is case-sensitive.
- Multiple search terms use AND logic (all terms must match).
- If no matches are found, the script will display "No matching bookmarks found."

## Customization

You can modify the `BOOKMARKS_FILE` variable in the script to change the location of your bookmarks file.

## Contributing

Feel free to fork this project and submit pull requests with improvements or bug fixes.

## License

This project is open-source and available under the MIT License.
