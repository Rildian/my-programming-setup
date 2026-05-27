return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype

        if ft == "cpp" or ft == "c" or ft == "h" or ft == "hpp" then
          return {
            timeout_ms = 1000,
            lsp_format = "never",
          }
        end

        return nil
      end,

      formatters_by_ft = {
        cpp = { "clang_format" },
        c = { "clang_format" },
        h = { "clang_format" },
        hpp = { "clang_format" },
      },

      formatters = {
        clang_format = {
          prepend_args = { "--style=file" },
        },
      },
    },
  },
}
