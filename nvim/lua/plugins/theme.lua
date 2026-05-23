-- 1. Calculate the time immediately when the file loads
local hour = tonumber(os.date("%H"))
local minute = tonumber(os.date("%M"))
local current_minutes = (hour * 60) + minute

-- 6:00 AM (360) to 5:00 PM (1020)
local is_day = current_minutes >= 360 and current_minutes < 1020

-- 2. Define the target theme and background based on the time
local target_theme = is_day and "catppuccin-latte" or "catppuccin-mocha"
local target_bg = is_day and "light" or "dark"

-- 3. Set Neovim's background early to prevent weird color flashing
vim.api.nvim_set_option_value("background", target_bg, {})

-- 4. Return your plugins using the dynamic theme variable
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = target_theme,
    },
  },
}
