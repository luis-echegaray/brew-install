#!/bin/bash

# Homebrew setup script for new Mac
# This script installs all the formulae and casks needed for development

set -e

echo "🍺 Starting Homebrew setup..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed, updating..."
    brew update
fi

echo "📦 Installing formulae..."
brew install \
    aws-elasticbeanstalk \
    awscli \
    ca-certificates \
    certifi \
    cffi \
    cryptography \
    flux \
    gettext \
    granted \
    k9s \
    libsodium \
    libunistring \
    libuv \
    libyaml \
    lpeg \
    luajit \
    luv \
    mpdecimal \
    neovim \
    nvm \
    openssl@3 \
    pycparser \
    python@3.13 \
    readline \
    sqlite \
    talosctl \
    tree-sitter \
    unibilium \
    utf8proc \
    xz \
    yarn

echo "🎯 Installing casks..."
brew install --cask \
    1password \
    appcleaner \
    discord \
    docker \
    elgato-capture-device-utility \
    firefox \
    ghostty \
    google-chrome \
    iterm2 \
    microsoft-remote-desktop \
    obs \
    slack \
    visual-studio-code

echo "🧹 Cleaning up..."
brew cleanup

echo "✅ Homebrew setup complete!"
echo ""
echo "📝 Additional setup notes:"
echo "- You may need to restart your terminal or run 'source ~/.zshrc'"
echo "- For NVM, you'll need to add it to your shell profile manually"
echo "- Some applications may require additional configuration"