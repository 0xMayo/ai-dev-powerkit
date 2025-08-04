#!/bin/bash
# One-liner installer for AI Dev PowerKit

curl -sSL https://raw.githubusercontent.com/0xMayo/ai-dev-powerkit/main/powerkit-install.sh | bash -s -- ${1:-"my-project"}