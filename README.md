## Installation
### 1. Install dependencies:
**Pacman:**
```
pacman -S stow foot fish
```
**Yay:**
```
yay -S stow foot fish
```
### 2. Clone the repository:
```bash
git clone https://github.com/NguyenThanhDuyOfficial/.dotfiles.git
cd .dotfiles
```
### 3. Symlink Configs:
```bash
stow -S Configs
```
### One-Liner (For Quick Setup):
```bash 
yay -S stow && git clone https://github.com/NguyenThanhDuyOfficial/.dotfiles.git && cd .dotfiles && stow -S Configs
```

## Change Theme
You can switch themes by symlinking a different theme config folder.
Example: Change to Catppucin-Macchiato
### 1. List Available Themes
```bash
cd ~/.dotfiles/Themes && ls
```
### 2. Apply a Theme
```bash
stow -t ~ -R Catppuccin-Macchiato
```
### One-Liner 
```
cd ~/.dotfiles/Themes && stow -t ~ -R Catppuccin-Macchiato
```



