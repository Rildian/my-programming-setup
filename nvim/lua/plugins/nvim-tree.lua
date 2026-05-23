return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      view = {
        adaptive_size = true,
      },
    })
  end,
}
