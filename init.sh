#!/bin/bash

# Exit immediately if a command exits with a non-zero status, 
# treat unset variables as an error, and fail on pipeline errors.
set -euo pipefail

# Define colors for output formatting
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define target directories
TEMPLATES_DIR=".agent/templates"
ACTIVE_DIR=".agent/active"
DOCS_DIR="docs"
GITHUB_DIR=".github"
VSCODE_DIR=".vscode"

# 0. Language selection
echo -e "${BLUE}Select language / 言語を選択してください:${NC}"
echo "  1) English"
echo "  2) 日本語 (Japanese)"
echo ""

LANGUAGE=""
while [ -z "$LANGUAGE" ]; do
    read -r -p "Enter 1 or 2 / 1 または 2 を入力: " lang_choice
    case "$lang_choice" in
        1|en|EN|english|English)
            LANGUAGE="en"
            ;;
        2|ja|JA|jp|JP|japanese|Japanese|日本語)
            LANGUAGE="ja"
            ;;
        *)
            echo -e "${YELLOW}Invalid choice. Please enter 1 (English) or 2 (Japanese).${NC}"
            echo -e "${YELLOW}無効な選択です。1（English）または 2（日本語）を入力してください。${NC}"
            ;;
    esac
done

if [ "$LANGUAGE" = "ja" ]; then
    TEMPLATE_GLOB="*.template.ja.md"
    TEMPLATE_SUFFIX=".template.ja.md"
    SETUP_PROMPT=".agent/setup.ja.md を読み、9問のセットアップインタビューを実施してください。"
else
    TEMPLATE_GLOB="*.template.md"
    TEMPLATE_SUFFIX=".template.md"
    SETUP_PROMPT="Please read .agent/setup.md and conduct the 9-question setup interview with me."
fi

echo ""
if [ "$LANGUAGE" = "ja" ]; then
    echo -e "${BLUE}🤖 AI エージェント コンテキスト ワークスペースを初期化しています...${NC}\n"
    echo "📂 ディレクトリ構造を作成しています..."
else
    echo -e "${BLUE}🤖 Bootstrapping AI Agent Context Workspace...${NC}\n"
    echo "📂 Creating directory structures..."
fi

# 1. Create necessary directory structures safely
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$ACTIVE_DIR"
mkdir -p "$DOCS_DIR"
mkdir -p "$GITHUB_DIR"
mkdir -p "$VSCODE_DIR"

if [ "$LANGUAGE" = "ja" ]; then
    echo -e "${GREEN}✓ ディレクトリを確認／作成しました。${NC}\n"
    echo "📋 アクティブ設定ファイルを初期化しています..."
else
    echo -e "${GREEN}✓ Directories verified/created.${NC}\n"
    echo "📋 Initializing active configuration files..."
fi

# 2. Non-destructive copy of language-specific templates to active directory
found_templates=0
# Use find to avoid pathname expansion edge cases with set -u / empty globs
while IFS= read -r -d '' template_file; do
    found_templates=1

    # Extract the base filename, stripping the language-specific template suffix
    base_name=$(basename "$template_file" "$TEMPLATE_SUFFIX")
    active_file="$ACTIVE_DIR/${base_name}.md"

    # Safe copy: Only copy if the active file does not already exist
    if [ ! -f "$active_file" ]; then
        cp "$template_file" "$active_file"
        if [ "$LANGUAGE" = "ja" ]; then
            echo -e "${GREEN}  ✅ 作成:${NC} $active_file"
        else
            echo -e "${GREEN}  ✅ Created:${NC} $active_file"
        fi
    else
        if [ "$LANGUAGE" = "ja" ]; then
            echo -e "${YELLOW}  ⏭️  スキップ:${NC} $active_file (既に存在します)"
        else
            echo -e "${YELLOW}  ⏭️  Skipped:${NC} $active_file (already exists)"
        fi
    fi
done < <(find "$TEMPLATES_DIR" -maxdepth 1 -type f -name "$TEMPLATE_GLOB" -print0 | sort -z)

if [ "$found_templates" -eq 0 ]; then
    if [ "$LANGUAGE" = "ja" ]; then
        echo -e "${YELLOW}⚠️  警告: $TEMPLATES_DIR に $TEMPLATE_GLOB ファイルが見つかりません。${NC}"
        echo "テンプレートディレクトリが正しく配置されているか確認してください。"
    else
        echo -e "${YELLOW}⚠️  Warning: No $TEMPLATE_GLOB files found in $TEMPLATES_DIR.${NC}"
        echo "Make sure you have populated the templates directory."
    fi
fi

echo ""
if [ "$LANGUAGE" = "ja" ]; then
    echo -e "${BLUE}🎉 初期化が完了しました！${NC}"
    echo -e "次のステップ:"
    echo -e "1. AI コーディングアシスタント（Cursor、Copilot、Claude など）を開きます。"
    echo -e "2. 次のプロンプトを貼り付けてください: ${YELLOW}\"${SETUP_PROMPT}\"${NC}"
else
    echo -e "${BLUE}🎉 Initialization complete!${NC}"
    echo -e "Next steps:"
    echo -e "1. Open your AI coding assistant (Cursor, Copilot, Claude, etc.)."
    echo -e "2. Paste the prompt: ${YELLOW}\"${SETUP_PROMPT}\"${NC}"
fi
