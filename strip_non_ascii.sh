#!/usr/bin/env bash
# Strip non-ASCII characters from minified JS files to prevent minification errors
# This is a workaround for emojis and other non-ASCII characters in VSCode source

set -e

echo "Stripping non-ASCII characters from minified JS files..."

# Function to strip non-ASCII from a file
strip_file() {
  local file="$1"
  if [[ -f "$file" ]]; then
    # Use perl for reliable non-ASCII removal (works on both macOS and Linux)
    perl -pi -e 's/[^\x00-\x7F]//g' "$file" 2>/dev/null || true
  fi
}

# Function to process a directory
process_dir() {
  local dir="$1"
  if [[ -d "$dir" ]]; then
    echo "Processing directory: $dir"
    find "$dir" -name "*.js" -type f | while read -r file; do
      strip_file "$file"
    done
  fi
}

# Process common output directories
for dir in \
  "out-vscode" \
  "vscode/out-vscode" \
  "VSCode-darwin-x64" \
  "VSCode-darwin-arm64" \
  "VSCode-linux-x64" \
  "VSCode-linux-arm64" \
  "VSCode-linux-armhf" \
  "VSCode-win32-x64" \
  "VSCode-win32-arm64" \
  "vscode-reh-darwin-x64" \
  "vscode-reh-darwin-arm64" \
  "vscode-reh-linux-x64" \
  "vscode-reh-linux-arm64" \
  "vscode-reh-win32-x64" \
  "vscode-reh-web-darwin-x64" \
  "vscode-reh-web-darwin-arm64" \
  "vscode-reh-web-linux-x64" \
  "vscode-reh-web-linux-arm64" \
  "vscode-reh-web-win32-x64"
do
  process_dir "$dir"
done

# Also process vscode subdirectory if it exists
if [[ -d "vscode" ]]; then
  for dir in vscode/out-vscode vscode/VSCode-* vscode/vscode-reh*; do
    process_dir "$dir"
  done
fi

echo "Non-ASCII character stripping complete."