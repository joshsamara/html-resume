#!/bin/sh
# Replace PHONE, STREET1, and STREET2 in 'src/resume.html' with new values.
#
# Notes:
#   Uses variables set in a .details file if it exists.
#   Defualts any missing values to REDACTED.
#   Creates formatted file in the 'build' dir

SOURCE_DIR="src"
DEST_DIR="build"
HTML_FILE="resume.html"
CSS_FILE="resume.css"
DEFAULT_VAL="REDACTED"

# Use a '.details' file for values
if [ -f '.details' ]; then
    source '.details'
fi

# Create the dest dir if it does not exist
mkdir -p "$DEST_DIR"

# Default any values
PHONE="${PHONE:-$DEFAULT_VAL}"
STREET1="${STREET1:-$DEFAULT_VAL}"
STREET2="${STREET2:-$DEFAULT_VAL}"

# Run any replacements
cat "$SOURCE_DIR/$HTML_FILE" |
sed -e "s/{{PHONE}}/$PHONE/" \
    -e "s/{{STREET1}}/$STREET1/" \
    -e "s/{{STREET2}}/$STREET2/" > "$DEST_DIR/$HTML_FILE"

# Copy over CSS
cp "$SOURCE_DIR/$CSS_FILE" "$DEST_DIR/$CSS_FILE"
