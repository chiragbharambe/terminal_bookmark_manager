# Terminal Bookmark Manager

A simple and efficient bookmark manager for the command line.

## Features

- Search bookmarks using multiple terms
- Add new bookmarks with multiple tags and categories
- Matches against URLs, tags, and categories
- Easy to use and integrate into your workflow

## Installation

1. Copy the `bm()` function into your `.zshrc` file or a separate script that you source in your `.zshrc`.
2. Create a file named `bookmarks` in your `~/Documents/` directory.
3. Restart your terminal or source your `.zshrc` file.

## Usage

### Searching Bookmarks

To search for bookmarks, use the `bm` command followed by one or more search terms:

```
bm <search term1> <search term2> ...
```

The search will match against URLs, tags, and categories.

### Adding Bookmarks

To add a new bookmark, use the `bm add` command followed by the URL, tags, and categories:

```
bm add <url> <tag1> <tag2> ... :: <category1> <category2> ...
```

Use `::` to separate tags from categories.

## Bookmark File Format

The bookmark file should be located at `~/Documents/bookmarks` and follow this format:

```
url, tags, categories
```

Example:
```
github.com, code repository version-control, programming
stackoverflow.com, q&a forum, programming
medium.com, blog articles, writing
spotify.com, music audio, streaming
netflix.com, video movies series, streaming
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

3. Add a new bookmark:
   ```
   $ bm add example.com example demo :: misc testing
   Bookmark added successfully.
   ```

## Notes

- The search is case-sensitive.
- Multiple search terms use AND logic (all terms must match).
- If no matches are found, the script will display "No matching bookmarks found."
- When adding bookmarks, use `::` to separate tags from categories.

## Customization

You can modify the `BOOKMARKS_FILE` variable in the script to change the location of your bookmarks file.

## Contributing

Feel free to fork this project and submit pull requests with improvements or bug fixes.

## License

This project is open-source and available under the MIT License.
