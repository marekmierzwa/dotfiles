return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("lualine").setup {
      options = {
        -- theme = "everforest",
        -- theme = "gruvbox",
        -- theme = "gruvbox-material",
        theme = "everforest",
      },
    }
  end,
}
