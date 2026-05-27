return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Build and debug current file",
        type = "codelldb",
        request = "launch",

        program = function()
          local source = vim.fn.expand("%:p")
          local output = vim.fn.expand("%:p:r")

          local result = vim.fn.system({
            "g++",
            "-std=c++20",
            "-g",
            "-Wall",
            "-Wextra",
            "-Wpedantic",
            source,
            "-o",
            output,
          })

          if vim.v.shell_error ~= 0 then
            error("Compilation failed:\n" .. result)
          end

          return output
        end,

        cwd = "${fileDirname}",
        stopOnEntry = false,
        terminal = "integrated",

        args = function()
          local input = vim.fn.input("Args: ")
          if input == nil or input == "" then
            return {}
          end
          return vim.split(input, " ")
        end,
      },

      {
        name = "Debug executable manually",
        type = "codelldb",
        request = "launch",

        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        terminal = "integrated",

        args = function()
          local input = vim.fn.input("Args: ")
          if input == nil or input == "" then
            return {}
          end
          return vim.split(input, " ")
        end,
      },
    }

    dap.configurations.c = dap.configurations.cpp
  end,
}
