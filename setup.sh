#!/bin/bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Setting up dev environment..."

install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    echo "✅ Homebrew already installed"
    return
  fi

  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "❌ Homebrew installed but brew binary was not found"
    exit 1
  fi
}

load_homebrew() {
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "❌ Homebrew is not available in this shell"
    exit 1
  fi
}

install_oh_my_zsh() {
  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "✅ Oh My Zsh already installed"
    return
  fi

  echo "⚡ Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_powerlevel10k() {
  local p10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

  if [[ -d "$p10k_dir" ]]; then
    echo "✅ Powerlevel10k already installed"
    return
  fi

  echo "🎨 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
}

install_font() {
  echo "🔤 Installing Meslo font for Powerlevel10k..."
  brew install --cask font-meslo-for-powerlevel10k
}

install_zsh_plugins() {
  echo "🔌 Installing Zsh plugins..."
  brew install zsh-autosuggestions zsh-syntax-highlighting
}

install_nvm() {
  echo "🟢 Installing NVM..."
  brew install nvm
}

copy_config_files() {
  echo "📄 Copying config files..."

  if [[ ! -f "$DOTFILES_DIR/.zshrc" ]]; then
    echo "❌ Missing file: $DOTFILES_DIR/.zshrc"
    exit 1
  fi

  if [[ ! -f "$DOTFILES_DIR/.p10k.zsh" ]]; then
    echo "❌ Missing file: $DOTFILES_DIR/.p10k.zsh"
    exit 1
  fi

  cp -f "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
  cp -f "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
}

install_homebrew
load_homebrew
install_oh_my_zsh
install_powerlevel10k
install_font
install_zsh_plugins
install_nvm
copy_config_files

echo ""
echo "✅ Setup complete"
echo ""
echo "Next steps:"
echo "1. Open iTerm2"
echo "2. Set font to: MesloLGS NF"
echo "3. Run: source ~/.zshrc"