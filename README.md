# 🧰 Dotfiles Setup (Zsh + Oh My Zsh + Powerlevel10k)

This repository contains my personal development environment setup for macOS, including:

- Zsh + Oh My Zsh  
- Powerlevel10k prompt  
- Zsh plugins (autosuggestions, syntax highlighting)  
- Node (nvm)  
- Bun  
- Custom aliases and PATH configuration  

---

## 🚀 Quick Setup (New Mac)

Run this single command:

```bash
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup.sh
```

---

## 📦 What gets installed

The setup script will automatically install:

- Homebrew (if not installed)  
- Oh My Zsh  
- Powerlevel10k theme  
- Meslo Nerd Font (required for icons)  
- Zsh plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
- Node Version Manager (nvm)  
- Bun  

It will also:

- Link `.zshrc` and `.p10k.zsh` from this repo to your home directory  

---

## ⚠️ Manual Step (Important)

After installation, open **iTerm2** and set the font:

Preferences → Profiles → Text → Font

Select:

MesloLGS NF

Without this, icons in the prompt will not render correctly.

---

## 🔁 Reload configuration

After setup:

```bash
source ~/.zshrc
```

---

## 🧠 Customization

### Powerlevel10k config

Edit:

```bash
~/.p10k.zsh
```

Or run:

```bash
p10k configure
```

---

### Zsh config

Edit:

```bash
~/.zshrc
```

---

## 💡 Useful aliases

```bash
reload      # reload zsh config
dotfiles    # go to dotfiles repo
dcup        # docker compose up + logs
dclogs      # docker compose logs
```

---

## 📁 Structure

```text
.dotfiles/
├── .zshrc
├── .p10k.zsh
├── setup.sh
└── README.md
```

---

## 🔒 Notes

- All paths use $HOME to ensure portability across machines  
- No hardcoded usernames or absolute paths  

---

## 🚀 Future improvements (optional)

- Add .gitconfig  
- Add global npm packages  
- Add project bootstrap scripts (Vue / Node)  
- Add macOS defaults (keyboard, Finder, etc.)  

---

## 🧑‍💻 Author

Maintained for personal use, but feel free to adapt.