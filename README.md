# My Programming Setup Tutorial

This tutorial is aimed to make it work through all my devices (such as my laptop or fresh re-install). My stack includes **nvim**, **tmux** and **alacritty**.

Currently, it worked on:

* Pop_OS! 22.04
* Pop_OS 24.04 (currently in use)

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

2. **Install Wayland Clipboard Tool**:

```bash
sudo apt update && sudo apt install wl-clipboard
```

```bash
mv <where this file was downloaded> ~/.config/
```

3. **Install node and npm** (unfortunately) by using nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash # node version manager
```

Given the nvm installed, now install node and npm

```
nvm install 20
nvm use 20
```

---

## Install the main tools

1. **Install Alacritty**:

```bash
apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
```

Then, move this to your config file:

```bash
cp -r <this repo>/alacritty/ ~/.config/ 
```

2. **Install Tmux**:

```bash
sudo apt install tmux
```

```bash
cp -r <this repo>/tmux/ ~/.config/ 
```

3. **Install Neovim** and then **LazyVim**

**Nvim**:

Run this:

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Then, add this to your shell config (~/.bashrc mainly):

```bash
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

**LazyVim**:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

After that, type `nvim` on terminal to take a look if it worked.

Then, you can finally just:

```bash
cp -r <this repo>/nvim/ ~/.config/nvim/  
```

And you're all set.
