#!/bin/bash
# AI Dev PowerKit - Unified Installer
# Installs ccsetup + agent-guides for maximum coding productivity

set -e

PROJECT_NAME=${1:-"my-project"}
TEMP_DIR="/tmp/powerkit-install"
START_DIR=$(pwd)

echo "🚀 AI Dev PowerKit - Unified Installer"
echo "Setting up: $PROJECT_NAME"
echo ""

# Check dependencies
command -v npm >/dev/null 2>&1 || { echo "❌ npm is required but not installed. Please install Node.js first."; exit 1; }
command -v git >/dev/null 2>&1 || { echo "❌ git is required but not installed."; exit 1; }

echo "📦 Step 1: Installing ccstart with all agents..."
npx ccstart $PROJECT_NAME --all-agents

echo ""
echo "🧠 Step 2: Setting up agent-guides..."

# Create temp directory
mkdir -p $TEMP_DIR
cd $TEMP_DIR

# Clone agent-guides
if [ ! -d "agent-guides" ]; then
    echo "Cloning agent-guides repository..."
    git clone https://github.com/tokenbender/agent-guides.git
fi

cd agent-guides

# Use the directory where the user ran the installer
PROJECT_DIR="$START_DIR/$PROJECT_NAME"

# Create commands directory
echo "Creating commands directory at: $PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/.claude/commands"

echo "Copying agent-guides commands..."

# Copy claude-commands directory if it exists
if [ -d "claude-commands" ]; then
    echo "Copying claude-commands directory..."
    cp -r claude-commands/* "$PROJECT_DIR/.claude/commands/" 2>/dev/null || true
fi

# Copy individual command/guide files
find . -name "*.md" -type f | grep -E "(command|guide|multi-mind)" | while read file; do
    echo "Found guide: $file"
    filename=$(basename "$file")
    cp "$file" "$PROJECT_DIR/.claude/commands/$filename" 2>/dev/null || true
done

echo "Commands copied to: $PROJECT_DIR/.claude/commands"
ls -la "$PROJECT_DIR/.claude/commands" 2>/dev/null || echo "Commands directory created but may be empty"

echo ""
echo "✅ Installation Complete!"
echo ""
echo "🎉 Your powerkit is ready! Here's what you got:"
echo ""
echo "📁 Project: $PROJECT_NAME"
echo "🤖 AI agents from ccstart"
echo "🧠 Multi-mind analysis from agent-guides"
echo "🔧 Integrated .claude commands"
echo ""
echo "📖 Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. code .  # or your favorite editor"
echo "3. Use Claude Code with your new superpowers!"
echo ""
echo "🔥 Pro Tips:"
echo "- Use '/project:multi-mind <topic>' for complex analysis"
echo "- Check .claude/commands/ for all available commands"
echo "- Run 'claude --help' to see what's possible"
echo ""

# Cleanup
cd /
rm -rf $TEMP_DIR