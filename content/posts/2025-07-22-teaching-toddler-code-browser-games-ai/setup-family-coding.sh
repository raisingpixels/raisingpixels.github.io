#!/bin/bash
# Quick VSCode + Cline setup for family coding
# Run with: curl -sSL https://raisingpixels.dev/.../setup-family-coding.sh | bash
echo "🚀 Setting up family coding environment..."
# Install or update VSCode
if [[ "$OSTYPE" == "darwin"* ]]; then
# macOS
if command -v code &> /dev/null; then
echo "✅ VSCode already installed, checking for updates..."
# VSCode auto-updates, but we can trigger a check
else
echo "📦 Installing VSCode for macOS..."
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" -o vscode.zip
unzip vscode.zip
mv "Visual Studio Code.app" /Applications/
rm vscode.zip
fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
# Linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
else
echo "⚠️  Please install VSCode manually from https://code.visualstudio.com/"
echo "   Then re-run this script to continue with Cline setup"
exit 1
fi
# Install Cline extension
echo "🤖 Installing Cline extension..."
code --install-extension saoudrizwan.claude-dev
# Create family coding directory
mkdir -p ~/family-coding-projects
cd ~/family-coding-projects
code ~/family-coding-projects
echo "✅ Setup complete! Time to start creating!"
echo "💡 Pro tip: Try the prompt in the blog post to make your first game together"
