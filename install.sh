#!/bin/bash

# TransXacto Networks - Keyboard Brightness Control Installer
# Enterprise-grade keyboard backlight automation for macOS
# https://transxacto.net

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# TransXacto banner
echo -e "${BLUE}"
cat << "EOF"
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║         ████████╗██████╗  █████╗ ███╗   ██╗███████╗       ║
║         ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝       ║
║            ██║   ██████╔╝███████║██╔██╗ ██║███████╗       ║
║            ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║       ║
║            ██║   ██║  ██║██║  ██║██║ ╚████║███████║       ║
║            ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝       ║
║                                                            ║
║              ██╗  ██╗ █████╗  ██████╗████████╗ ██████╗    ║
║              ╚██╗██╔╝██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗   ║
║               ╚███╔╝ ███████║██║        ██║   ██║   ██║   ║
║               ██╔██╗ ██╔══██║██║        ██║   ██║   ██║   ║
║              ██╔╝ ██╗██║  ██║╚██████╗   ██║   ╚██████╔╝   ║
║              ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝    ║
║                                                            ║
║              Keyboard Brightness Control Installer         ║
║                  Enterprise macOS Automation               ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo ""
echo -e "${GREEN}Welcome to TransXacto Networks Keyboard Control${NC}"
echo -e "${BLUE}Enterprise-grade keyboard backlight automation for macOS${NC}"
echo ""
echo "This installer will:"
echo "  • Install Homebrew (if not already installed)"
echo "  • Install Hammerspoon automation framework"
echo "  • Configure TransXacto keyboard brightness control"
echo "  • Set up menu bar controls"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}Error: This installer is for macOS only${NC}"
    exit 1
fi

# Check for Homebrew
echo ""
echo -e "${YELLOW}Checking for Homebrew...${NC}"
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    echo -e "${GREEN}✓ Homebrew installed successfully${NC}"
else
    echo -e "${GREEN}✓ Homebrew already installed${NC}"
fi

# Install Hammerspoon
echo ""
echo -e "${YELLOW}Installing Hammerspoon...${NC}"
if ! brew list hammerspoon &> /dev/null; then
    brew install --cask hammerspoon
    echo -e "${GREEN}✓ Hammerspoon installed successfully${NC}"
else
    echo -e "${GREEN}✓ Hammerspoon already installed${NC}"
fi

# Create Hammerspoon directory if it doesn't exist
HAMMERSPOON_DIR="$HOME/.hammerspoon"
mkdir -p "$HAMMERSPOON_DIR"

# Backup existing config if present
if [ -f "$HAMMERSPOON_DIR/init.lua" ]; then
    echo ""
    echo -e "${YELLOW}Backing up existing Hammerspoon config...${NC}"
    mv "$HAMMERSPOON_DIR/init.lua" "$HAMMERSPOON_DIR/init.lua.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${GREEN}✓ Backup created${NC}"
fi

# Copy TransXacto config
echo ""
echo -e "${YELLOW}Installing TransXacto keyboard control...${NC}"
cp "$(dirname "$0")/hammerspoon/init.lua" "$HAMMERSPOON_DIR/init.lua"
echo -e "${GREEN}✓ Configuration installed${NC}"

# Enable accessibility permissions
echo ""
echo -e "${YELLOW}Configuring accessibility permissions...${NC}"
echo ""
echo -e "${BLUE}IMPORTANT:${NC} You need to grant Hammerspoon accessibility permissions:"
echo "  1. Open Hammerspoon (it should launch automatically)"
echo "  2. When prompted, go to System Settings > Privacy & Security > Accessibility"
echo "  3. Enable Hammerspoon in the list"
echo "  4. Click 'Reload Config' in the Hammerspoon menu"
echo ""

# Launch Hammerspoon
echo -e "${YELLOW}Launching Hammerspoon...${NC}"
open -a Hammerspoon

echo ""
echo -e "${GREEN}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✓ Installation Complete!${NC}"
echo -e "${GREEN}════════════════════════════════════════════════════════════${NC}"
echo ""
echo "TransXacto Keyboard Control is now installed!"
echo ""
echo "Usage:"
echo "  • Look for the 💡 icon in your menu bar"
echo "  • Click it to adjust keyboard brightness"
echo "  • Brightness levels: Off, 50%, 100%"
echo ""
echo "Next steps:"
echo "  1. Grant accessibility permissions (see instructions above)"
echo "  2. Reload Hammerspoon config if needed"
echo "  3. Start controlling your keyboard brightness!"
echo ""
echo -e "${BLUE}Visit https://transxacto.net for more enterprise automation tools${NC}"
echo ""
