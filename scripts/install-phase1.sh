#!/bin/bash
# AI Dev PowerKit - Phase 1 Installation

echo "🚀 Installing AI Dev PowerKit - Phase 1..."

# Create symlink for easy access
if [ ! -f /usr/local/bin/powerkit ]; then
    echo "Creating powerkit command..."
    ln -sf "$(pwd)/phase1/powerkit.py" /usr/local/bin/powerkit
    echo "✅ powerkit command installed"
else
    echo "ℹ️  powerkit command already exists"
fi

echo "
🎉 Phase 1 Installation Complete!

Available commands:
  powerkit multi-mind <topic>    # Multi-specialist analysis
  powerkit setup                 # Project setup
  powerkit agents               # List available agents

Next steps:
- Run 'powerkit agents' to see available tools
- Start with 'powerkit multi-mind' for complex analysis
- Use 'powerkit setup' for new project initialization
"