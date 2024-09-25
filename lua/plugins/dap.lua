return {
  "mfussenegger/nvim-dap",
  event = { "LazyFile", "BufReadPre", "BufReadPost", "BufNewFile" },
  optional = true,
  dependencies = {
    {
      "microsoft/vscode-js-debug",
      build = "bun i && bun i && bun x gulp dapDebugServer",
    },
  },
  opts = function()
    local dap = require("dap")

    vim.keymap.set("n", "<leader>dA", function()
      require("dap").set_exception_breakpoints({ "Notice", "Warning", "Error", "Exception" })
    end, { desc = "Stop on all" })

    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          "/home/lippiece/.local/share/nvim/lazy/vscode-js-debug/dist/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file (JS/TS)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "tsx",
          externalTerminal = true,
          breakOnErrorEntry = true,
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file (JS)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
          externalTerminal = true,
          breakOnErrorEntry = true,
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end

    dap.defaults.fallback.exception_breakpoints = { "raised", "uncaught" }
    dap.defaults.typescript.exception_breakpoints = { "raised", "uncaught" }
    dap.defaults.javascript.exception_breakpoints = { "raised", "uncaught" }
  end,
}
