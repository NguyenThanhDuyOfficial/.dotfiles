>[!WARNING]
> These dotfiles are **under active development**.
> Use at your own risk — things may change, break, or be incomplete.
## 🌈 About The Dotfiles
I came to Linux with a lot of surprise at how freely I could do whatever I wanted. It made me wonder — what if I could configure my own Linux system from scratch? I wanted to create a truly awesome environment — a place I could genuinely feel at home.

You’re welcome to use these dotfiles directly, **but I highly recommend treating them as a template** to create your own personalized setup ✨

>  _You’ll never know how awesome your own dotfiles can be — until you start creating them._
## 📦 Dependencies
Software used in this dotfiles:
- [Archlinux](https://archlinux.org/)
- [Hyprland](https://hyprland.org/)
- [foot](https://codeberg.org/dnkl/foot)
- [swww](https://github.com/LGFae/swww)
- [rofi-wayland](https://github.com/lbonn/rofi)
- CaskaydiaMono Nerd Font
- Bibata Modern Ice Cursor Theme
- [Fish](https://fishshell.com/)
  - [Starship](https://github.com/starship/starship)
- [Neovim](https://neovim.io/)
- [eww](https://github.com/elkowar/eww)
- And many more...
## 🚀 Getting Started
🛠️ _I currently don't plan to write an installation script._  
>I believe it's better if you take the time to explore and install your preferred Linux distribution, compositor, and tools on your own — it'll be a much more rewarding experience.
### 📝 Prerequisites
1. Install a Linux Distribution as your choice
2. Install [Hyprland](https://wiki.hyprland.org/Getting-Started/Installation/)
3. Install an AUR helper like [yay](https://github.com/Jguer/yay)
4. Install software dependencies used in this dotfiles setup
_(Feel free to change or add tools as you prefer)_
```bash
yay -S stow foot swww rofi-wayland ttf-cascadia-mono-nerd bibata-cursor-theme fish neovim starship socat
```
4.1 Install [eww](https://elkowar.github.io/eww)
### ⬇️ Installation
Clone the repository then symlink using stow:
```bash
git clone https://github.com/NguyenThanhDuyOfficial/.dotfiles && cd .dotfiles && stow -S Configs
```
### 🔧 Configuration
In this part, you're expected to follow the **DIY (Do It Yourself)** principle:  Visit the official websites of the software you use, read the documentation, and configure everything by yourself 💪🏼

### Fixed Issues With Discord
add --enable-features=UseOzonPlatform --ozone-platform=wayland --enable-wayland-ime to desktop file.
## 💡 Usage
This section will be developed continuously throughout the evolution of the dotfiles.
## 🤝 Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request
## 📄 License

Distributed under the GPL-3.0 License. See `LICENSE.txt` for more information.
## 📬 Contact
Duy - [nguyenthanhduyofficial@gmail.com](mailto:nguyenthanhduyofficial@gmail.com)
## 💖 Acknowledgments
I want to express my respect to the developers and contributors of the open-source tools that make this dotfiles setup possible.
This dotfiles setup wouldn’t exist without the hard work of the open-source community. 💖

