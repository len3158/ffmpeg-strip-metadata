#!/bin/bash

# Directory to process (current directory)
SOURCE_DIR="$(pwd)"

# Output directory
OUTPUT_DIR="$SOURCE_DIR/cleaned"
mkdir -p "$OUTPUT_DIR"

echo "Stripping metadata from MP4 files in: $SOURCE_DIR"
echo "Output will be saved to: $OUTPUT_DIR"
echo

for filepath in "$SOURCE_DIR"/*.mp4; do
  if [ -f "$filepath" ]; then
    filename=$(basename "$filepath")
    name="${filename%.*}"
    output_file="$OUTPUT_DIR/${name}_clean.mp4"

    echo "Processing: $filename"

    ffmpeg -i "$filepath" -map 0 -c copy -map_metadata -1 "$output_file" -y

    echo "Saved: $output_file"
    echo
  fi
done

echo "✅ All files processed."