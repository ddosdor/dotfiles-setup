#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Setting up dev environment..."

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed"
fi

# Load Homebrew into current shell
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "⚡ Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh already installed"
fi

# Powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [[ ! -d "$P10K_DIR" ]]; then
  echo "🎨 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  echo "✅ Powerlevel10k already installed"
fi

# Font
echo "🔤 Installing Meslo font for Powerlevel10k..."
brew install --cask font-meslo-for-powerlevel10k || true

# Zsh plugins
echo "🔌 Installing Zsh plugins..."
brew install zsh-autosuggestions zsh-syntax-highlighting

# Node tools
echo "🟢 Installing Node tools..."
brew install nvm

# Bun
echo "🥟 Installing Bun..."
brew install bun

# Copy config files
echo "📄 Copying config files..."
cp -f "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp -f "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Open iTerm2"
echo "2. Set font to: MesloLGS NF"
echo "3. Run: source ~/.zshrc"