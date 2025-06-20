#!/bin/bash

# Homebrew setup script for new Mac
# This script installs all the formulae and casks needed for development

set -e

echo "🍺 Starting Homebrew setup..."

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed, updating..."
    brew update
fi

echo "📦 Adding custom taps..."
brew tap common-fate/granted

echo "📦 Installing formulae..."
brew install \
    act \
    autoconf \
    aws-cdk \
    aws-elasticbeanstalk \
    aws-iam-authenticator \
    aws-sam-cli \
    awscli \
    awslogs \
    bash \
    bash-completion \
    ca-certificates \
    certifi \
    cffi \
    cfn-lint \
    coreutils \
    cryptography \
    docker-compose \
    eksctl \
    ffmpeg \
    flux \
    gettext \
    gh \
    git \
    git-delta \
    go \
    granted \
    helm \
    iperf3 \
    jq \
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
    nmap \
    nvm \
    openssl@3 \
    readline \
    shellcheck \
    sqlite \
    talosctl \
    tree-sitter \
    unibilium \
    utf8proc \
    wget \
    xz \
    yarn \
    yq \
    zsh-syntax-highlighting

# Optional: Install additional useful tools
echo "🔧 Installing additional development tools..."
brew install \
    bat \
    bottom \
    broot \
    colima \
    eza \
    fd \
    fzf \
    hyperfine \
    lazygit \
    lsd \
    ripgrep \
    starship \
    tldr \
    tree \
    watchman \
    zoxide

echo "🎯 Installing casks..."
brew install --cask \
    1password \
    appcleaner \
    claude \
    datagrip \
    discord \
    docker \
    fantastical \
    firefox \
    ghostty \
    google-chrome \
    google-drive \
    iterm2 \
    kap \
    maccy \
    microsoft-remote-desktop \
    obs \
    session-manager-plugin \
    slack \
    tailscale \
    the-unarchiver \
    transmit \
    visual-studio-code \
    vlc \
    whatsapp

echo "🧹 Cleaning up..."
brew cleanup

echo "⚙️ Configuring macOS system preferences..."

# Turn off natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Set Dock to auto-hide
defaults write com.apple.dock autohide -bool true

# Speed up Dock animations
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Remove Dock auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable "natural" (Lion-style) scrolling for trackpad
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase trackpad tracking speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5

# Enable three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

# Save screenshots to Desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

echo "🔄 Restarting affected applications..."
killall Finder
killall Dock
killall SystemUIServer

echo "✅ Homebrew setup complete!"
echo ""
echo "📝 Additional setup notes:"
echo "- You may need to restart your terminal or run 'source ~/.zshrc'"
echo "- For NVM, add this to your ~/.zshrc: export NVM_DIR=\"\$HOME/.nvm\" && [ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\""
echo "- For pyenv, add this to your ~/.zshrc: export PATH=\"\$HOME/.pyenv/bin:\$PATH\" && eval \"\$(pyenv init --path)\" && eval \"\$(pyenv init -)\""
echo "- Consider configuring starship prompt: echo 'eval \"\$(starship init zsh)\"' >> ~/.zshrc"
echo "- Set up fzf key bindings: \$(brew --prefix)/opt/fzf/install"
echo "- Some applications may require additional configuration"
echo ""
echo "🚀 Recommended post-install actions:"
echo "- Run 'gh auth login' to authenticate GitHub CLI"
echo "- Configure Git with your credentials: git config --global user.name 'Your Name'"
echo "- Set up AWS CLI: aws configure"
echo "- Configure Docker Desktop and enable Kubernetes if needed"
