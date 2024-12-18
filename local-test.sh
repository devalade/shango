#!/bin/bash

# Define the destination directory
DEST_DIR="$HOME/.local/share/shango"

# Remove the existing directory if it exists
if [ -d "$DEST_DIR" ]; then
  rm -rf "$DEST_DIR"
fi

# Copy the current project to the destination directory
cp -r . "$DEST_DIR"

echo "Project copied to $DEST_DIR"
