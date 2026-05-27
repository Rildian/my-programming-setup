return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--query-driver=/usr/bin/g++*", -- Tells clangd to ask g++ for header locations
          "--background-index",
          "--clang-tidy",
        },
      },
    },
  },
}
