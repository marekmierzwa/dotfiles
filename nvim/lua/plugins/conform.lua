return {
  "stevearc/conform.nvim",
  opts = {},

  config = function()
    require("conform").setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        mdx = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
      },

      default_format_opts = {
        lsp_format = "fallback",
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },

      -- ft_parsers = {
      --   javascript = "babel",
      --   javascriptreact = "babel",
      --   typescript = "typescript",
      --   typescriptreact = "typescript",
      --   vue = "vue",
      --   css = "css",
      --   scss = "scss",
      --   less = "less",
      --   html = "html",
      --   json = "json",
      --   jsonc = "json",
      --   yaml = "yaml",
      --   markdown = "markdown",
      --   ["markdown.mdx"] = "mdx",
      --   graphql = "graphql",
      --   handlebars = "glimmer",
      -- },

      formatters = {},
    }
  end,
}
