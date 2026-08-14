#!/bin/bash

# Exit immediately if a command exits with a non-zero status, 
# treat unset variables as an error, and fail on pipeline errors.
set -euo pipefail

# Define colors for output formatting
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Bootstrapping AI Agent Context Workspace...${NC}\n"

# Define target directories
TEMPLATES_DIR=".agent/templates"
ACTIVE_DIR=".agent/active"
DOCS_DIR="docs"
GITHUB_DIR=".github"
VSCODE_DIR=".vscode"

# 1. Create necessary directory structures safely
echo "📂 Creating directory structures..."
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$ACTIVE_DIR"
mkdir -p "$DOCS_DIR"
mkdir -p "$GITHUB_DIR"
mkdir -p "$VSCODE_DIR"
echo -e "${GREEN}✓ Directories verified/created.${NC}\n"

# 2. Non-destructive copy of templates to active directory
echo "📋 Initializing active configuration files..."

# Check if there are template files to process
if ls "$TEMPLATES_DIR"/*.template.md 1> /dev/null 2>&1; then
    for template_file in "$TEMPLATES_DIR"/*.template.md; do
        # Extract the base filename, stripping out '.template.md' and appending '.md'
        base_name=$(basename "$template_file" .template.md)
        active_file="$ACTIVE_DIR/${base_name}.md"

        # Safe copy: Only copy if the active file does not already exist
        if [ ! -f "$active_file" ]; then
            cp "$template_file" "$active_file"
            echo -e "${GREEN}  ✅ Created:${NC} $active_file"
        else
            echo -e "${YELLOW}  ⏭️  Skipped:${NC} $active_file (already exists)"
        fi
    done
else
    echo -e "${YELLOW}⚠️  Warning: No .template.md files found in $TEMPLATES_DIR.${NC}"
    echo "Make sure you have populated the templates directory."
fi

echo -e "\n${BLUE}🎉 Initialization complete!${NC}"
echo -e "Next steps:"
echo -e "1. Open your AI coding assistant (Cursor, Copilot, Claude, etc.)."
echo -e "2. Paste the prompt: ${YELLOW}\"Please read .agent/setup.md and conduct the 9-question setup interview with me.\"${NC}"
