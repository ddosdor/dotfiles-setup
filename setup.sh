#!/bin/bash

echo "🚀 Setting up dev environment..."

# Homebrew
if ! command -v brew &> /dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚡ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "🎨 Installing powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Font (IMPORTANT)
echo "🔤 Installing Meslo Nerd Font..."
brew install --cask font-meslo-for-powerlevel10k

# Plugins
echo "🔌 Installing plugins..."
brew install zsh-autosuggestions zsh-syntax-highlighting

# Node tools
echo "🟢 Installing node tools..."
brew install nvm

# Bun (optional)
brew install bun

# Link config files
echo "🔗 Linking dotfiles..."
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

echo "✅ Done!"
echo ""
echo "👉 IMPORTANT:"
echo "1. Open iTerm2"
echo "2. Set font to: MesloLGS NF"
echo "3. Run: source ~/.zshrc"