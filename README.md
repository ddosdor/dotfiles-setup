# 🧰 Dotfiles Setup (Zsh + Oh My Zsh + Powerlevel10k)

This repository contains my personal macOS terminal setup, including:

- Zsh
- Oh My Zsh
- Powerlevel10k prompt
- Zsh plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
- Node Version Manager (nvm)
- Custom aliases and PATH configuration

---

## 🚀 Installation on a New Mac

Clone the repository and run the setup script:

```bash
git clone git@github.com:ddosdor/dotfiles-setup.git
cd dotfiles-setup
chmod +x setup.sh
./setup.sh
```

---

## 📦 What the Setup Script Does

The script will:

- Install Homebrew if it is not installed
- Install Oh My Zsh if it is not installed
- Install Powerlevel10k
- Install the Meslo font required by Powerlevel10k
- Install Zsh plugins:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- Install `nvm`
- Copy `.zshrc` and `.p10k.zsh` into your home directory

---

## ⚠️ Manual Step Required

After running the setup, open **iTerm2** and set the font manually:

**iTerm2 → Settings → Profiles → Text → Font**

Select:

**MesloLGS NF**

Without this font, Powerlevel10k icons will not render correctly.

---

## 🔁 Reload the Shell

After installation, run:

```bash
source ~/.zshrc
```

You can also open a new terminal window instead.

---

## 🧠 Files Included

- `.zshrc` – main Zsh configuration
- `.p10k.zsh` – Powerlevel10k prompt configuration
- `setup.sh` – installation script
- `README.md` – setup instructions

---

## 📁 Repository Structure

```text
.
├── .zshrc
├── .p10k.zsh
├── setup.sh
└── README.md
```

---

## 💡 Useful Aliases

The setup includes these aliases:

```bash
reload      # reload ~/.zshrc
dotfiles    # go to the dotfiles repository
dclogs      # docker compose logs -f --timestamps
dcup        # docker compose up -d && dclogs
```

---

## 🔒 Notes

- The setup uses portable paths based on `$HOME`
- No hardcoded usernames or machine-specific paths are used
- Config files are copied, not symlinked

---

## 🧑‍💻 Customization

To update your prompt later, edit:

```bash
~/.p10k.zsh
```

or run:

```bash
p10k configure
```

To update your shell config, edit:

```bash
~/.zshrc
```

---

## ✅ Verified Setup Flow

1. Clone the repository
2. Run `./setup.sh`
3. Set `MesloLGS NF` in iTerm2
4. Run `source ~/.zshrc`

---

## 🧑‍💻 Author

Maintained for personal use.