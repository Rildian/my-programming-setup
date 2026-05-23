return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- This sets your search to <leader>f<space>
      -- Since your leader is space, the physical keys are: Space -> f -> Space
      {
        "<leader>f<space>",
        "<cmd>FzfLua files<cr>",
        desc = "Find Files (FZF)",
      },

      -- Optional: Disable the default LazyVim <leader><space>
      -- so you don't trigger it by accident
      { "<leader><space>", false },
    },
  },
}
