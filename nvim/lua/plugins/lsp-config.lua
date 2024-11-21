return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "cssls",
          "html",
          "eslint",
          "css_variables",
          "marksman",
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup {}
      lspconfig.ts_ls.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.eslint.setup {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "css",
        },
      }
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.cssls.setup {}
      lspconfig.css_variables.setup {}
      lspconfig.marksman.setup {}

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
