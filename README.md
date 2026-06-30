## Installation

Remove any existing Neovim configuration:

```bash
rm -rf ~/.config/nvim
```

**Linux/macOS:**

```bash
git clone https://github.com/3t73rn17y/nvim-config ~/.config/nvim
```

**Windows (PowerShell):**

```powershell
git clone https://github.com/3t73rn17y/nvim-config $env:LOCALAPPDATA\nvim
```

Then just open Neovim — Lazy will auto-bootstrap and install all your plugins on first launch.

## Optional: Relative Line Numbers

If you'd like relative line numbers, open your config file (typically located at `~/.config/nvim/init.lua`) and add the following:

```lua
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Optional: Enable "hybrid" mode (shows the absolute line number on the current line)
vim.opt.number = true
```

## Troubleshooting

If you're getting errors, make sure your Neovim is up to date:

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```
