# My Programming Setup Tutorial

This tutorial is aimed to make it work through all my devices (such as my laptop or fresh re-install). My stack includes **nvim**, **tmux** and **alacritty**.

Currently, it worked on:

* Pop_OS! 22.04
* Pop_OS 24.04 (currently in use)

## Version baseline

This setup is currently tested with:

| Tool | Version / source |
|---|---|
| Neovim | `0.12.3` |
| LazyVim | lockfile commit in `nvim/lazy-lock.json` |
| lazy.nvim plugins | lockfile commits in `nvim/lazy-lock.json` |
| tmux | `3.4` |
| Alacritty | `0.13.2` |
| Node.js | `20.20.2` via `nvm` and `.nvmrc` |
| npm | `10.8.2` |
| Font | JetBrainsMono Nerd Font |
| Clipboard | `wl-clipboard` on Wayland |

Notes:

* Neovim plugin versions are reproducible through `nvim/lazy-lock.json`.
* LazyVim extras are listed in `nvim/lazyvim.json`.
* tmux plugins are configured in `tmux/tmux.conf`; `catppuccin/tmux` is pinned to `v2.3.0`.
* The Neovim theme switches automatically: `catppuccin-latte` from 06:00 to 17:00 and `catppuccin-mocha` outside that window.

## Dependencies

1. **Download [Nerd Font]**(<https://www.nerdfonts.com/font-downloads>)

* Choose JetBrainsMono Nerd Font

On terminal:

```bash
mkdir -p ~/.local/share/fonts
cp ~/Downloads/*.{ttf,otf} ~/.local/share/fonts/
fc-cache -fv
```

In Pop_OS's Desktop Appearance:

* Set **System Font** as 'JetBrainsMono Nerd Font'
* Set **Monospace** font as 'JetBrainsMono Nerd Font Mono'

1. **Install Wayland Clipboard Tool**:

```bash
sudo apt update && sudo apt install wl-clipboard
```

```bash
mv <where this file was downloaded> ~/.config/
```

1. **Install node and npm** (unfortunately) by using nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash # node version manager
```

Given the nvm installed, now install node and npm

```
nvm install
nvm use
```

---

## Install the main tools

1. **Install Alacritty**:

```bash
sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
```

Then, move this to your config file:

```bash
cp -r <this repo>/alacritty/ ~/.config/ 
```

1. **Install Tmux**:

```bash
sudo apt install tmux
```

```bash
cp -r <this repo>/tmux/ ~/.config/ 
```

1. **Install Neovim** and this LazyVim config

**Nvim**:

Run this:

```bash
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.3/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Then, add this to your shell config (~/.bashrc mainly):

```bash
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

This repo already contains the LazyVim config under `nvim/`. Do not copy it inside an
existing `~/.config/nvim`, otherwise Neovim will keep loading the old config and your
repo config will end up ignored at `~/.config/nvim/nvim`.

From this repo root, install it as a symlink:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
ln -s "$(pwd)/nvim" ~/.config/nvim
nvim
```

Then run `:Lazy sync` inside Neovim.
