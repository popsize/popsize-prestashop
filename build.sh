#!/bin/bash

# Popsize Module Build Script
# This script creates a distribution-ready zip file for the Popsize PrestaShop module

set -e  # Exit on any error

# Configuration
MODULE_NAME="popsize"
BUILD_DIR="build"
TEMP_DIR="${BUILD_DIR}/temp"
OUTPUT_DIR="${BUILD_DIR}/dist"
ZIP_NAME="${MODULE_NAME}.zip"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get the script directory (where build.sh is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

print_status "Starting build process for $MODULE_NAME module..."

# Clean previous build
if [ -d "$BUILD_DIR" ]; then
    print_status "Cleaning previous build..."
    rm -rf "$BUILD_DIR"
fi

# Create build directories
print_status "Creating build directories..."
mkdir -p "$TEMP_DIR"
mkdir -p "$OUTPUT_DIR"

# Files and directories to include in the distribution
FILES_TO_INCLUDE=(
    "views/"
    "tests/"
    ".gitignore"
    ".php-cs-fixer.dist.php"
    "agpl.txt"
    "composer.json"
    "composer.lock"
    "index.php"
    "LICENSE"
    "logo.png"
    "popsize.php"
)

print_status "Copying files to temporary directory..."

# Copy each file/directory to temp directory
for item in "${FILES_TO_INCLUDE[@]}"; do
    if [ -e "$item" ]; then
        print_status "Copying $item..."
        if [ -d "$item" ]; then
            # It's a directory, copy recursively
            cp -r "$item" "$TEMP_DIR/"
        else
            # It's a file, copy it
            cp "$item" "$TEMP_DIR/"
        fi
    else
        print_warning "File/directory $item not found, skipping..."
    fi
done

# Verify required files are present
print_status "Verifying required files..."
REQUIRED_FILES=("popsize.php" "index.php" "LICENSE")
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$TEMP_DIR/$file" ]; then
        print_error "Required file $file is missing!"
        exit 1
    fi
done

# Create the zip file
print_status "Creating zip file..."
cd "$TEMP_DIR"
zip -r "../dist/$ZIP_NAME" . -x "*.DS_Store" "*Thumbs.db" "*.git*"
cd "$SCRIPT_DIR"

# Verify the zip was created
if [ -f "$OUTPUT_DIR/$ZIP_NAME" ]; then
    ZIP_SIZE=$(du -h "$OUTPUT_DIR/$ZIP_NAME" | cut -f1)
    print_status "Build completed successfully!"
    print_status "Output: $OUTPUT_DIR/$ZIP_NAME (${ZIP_SIZE})"
    
    # List contents of the zip for verification
    print_status "Zip contents:"
    unzip -l "$OUTPUT_DIR/$ZIP_NAME"
else
    print_error "Failed to create zip file!"
    exit 1
fi

# Clean up temp directory
print_status "Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

print_status "Build process completed!"
echo ""
echo "The distribution zip is ready at: $OUTPUT_DIR/$ZIP_NAME"
echo "You can now upload this zip to install the module on other PrestaShop instances."
