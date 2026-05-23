return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Tell conform to ONLY use php-cs-fixer for PHP files
      php = { "php_cs_fixer" },
    },
  },
}
