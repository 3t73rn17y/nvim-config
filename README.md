rm -rf ~/.config/nvim


Linux/macOS:
git clone https://github.com/3t73rn17y/nvim-config ~/.config/nvim


Windows (PowerShell):
powershell
git clone https://github.com/3t73rn17y/nvim-config $env:LOCALAPPDATA\nvim

Then just open Neovim — Lazy will auto-bootstrap and install all your plugins on first launch.






**ADD relative lines if wanted:**

For Lua Configurations:

**(init.lua)**Open your config file **(typically located at ~/.config/nvim/init.lua)** and add the following lines:

-- Enable relative line numbers

vim.opt.relativenumber = true

-- Optional: Enable "hybrid" mode (shows the absolute line number on the current line)

vim.opt.number = true
