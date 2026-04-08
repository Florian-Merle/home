# 🏠 Home

Personal system configuration and bootstrap instructions

## Regolith

https://regolith-desktop.com/

```
sudo apt install regolith-desktop regolith-session-flashback regolith-look-ayu

ln -s ~/home/regolith3/Xresources ~/.config/regolith3/Xresources
ln -s ~/home/regolith3/i3 ~/.config/regolith3/i3
ln -s ~/home/regolith3/i3xrocks/conf.d /usr/share/i3xrocks/conf.d
ln -s ~/home/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg
```

Run the following command to see an application's WM_CLASS: `xprop | grep WM_CLASS`.

## keyd

https://github.com/rvaiya/keyd

```
ln -s ~/home/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable keyd && sudo systemctl start keyd
sudo keyd reload
```

## Alacritty

https://alacritty.org/

```
sudo apt install alacritty
ln -s ~/home/alacritty ~/.config/alacritty
```

## Starship

https://starship.rs/

```
ln -s ~/home/starship/starship.toml ~/.config/starship.toml
```

## Bash

https://cgit.git.savannah.gnu.org/cgit/bash.git

```
echo "source /home/florian/home/bash/.bashrc" >> ~/.bashrc
```

## ZSH & oh my zsh

https://fr.wikipedia.org/wiki/Z_Shell
https://ohmyz.sh/

```
ln -s ~/home/zsh/.zshrc ~/.zshrc
```

## bat

https://github.com/sharkdp/bat

```
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# for delta PHP diffs
mkdir -p ~/.config/bat/syntaxes
ln -s ~/home/bat/syntaxes/PHP.sublime-syntax ~/.config/bat/syntaxes/PHP.sublime-syntax
bat cache --build
```

## delta

https://github.com/dandavison/delta

```
brew install git-delta

```

## Git

https://git-scm.com/

```
ln -s ~/home/git/.gitconfig ~/.gitconfig
sudo systemctl enable keyd && sudo systemctl start keyd
sudo keyd reload
```

## Neovim

https://neovim.io/

https://github.com/Florian-Merle/minimum-viable-neovim-config

```
brew install neovim tree-sitter-cli
```

## tmux

https://github.com/tmux/tmux & https://github.com/tmux-plugins/tpm

```
ln -s ~/home/tmux/tmux.conf ~/.config/tmux/tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Don't forget to install plugins. See https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installing-plugins

## Phpactor

https://phpactor.readthedocs.io/

See https://phpactor.readthedocs.io/en/master/usage/standalone.html#manual-installation

```
sudo ln -s ~/your/projects/phpactor/bin/phpactor /usr/local/bin/phpactor

ln -s ~/home/phpactor ~/.config/phpactor
```

## Docker

https://www.docker.com

```sh
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Claude Code

https://claude.ai/code

```sh
npm install -g @anthropic-ai/claude-code

ln -s ~/home/claude/AGENTS.md ~/.claude/AGENTS.md
ln -s ~/home/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/home/claude/settings.json ~/.claude/settings.json
```

## Other

Disable touchscreen

```
# /etc/X11/xorg.conf.d/99-disable-touchscreen.conf
Section "InputClass"
    Identifier "Disable Touchscreen"
    MatchProduct "LXT2021:00 29BD:3201"
    Option "Ignore" "true"
EndSection
```

Set https://qwerty-fr.org/ keyboard layout

```
# /etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "us"
    Option "XkbVariant" "qwerty-fr"
EndSection
```

Disable network notifications

```
gsettings set org.gnome.nm-applet disable-disconnected-notifications "true"
gsettings set org.gnome.nm-applet disable-connected-notifications "true"
```
