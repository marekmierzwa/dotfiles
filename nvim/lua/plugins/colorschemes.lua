return {
  --   {
  --     "ellisonleao/gruvbox.nvim",
  -- priority = 1000,

  -- config = function()
  -- 	vim.cmd.colorscheme("gruvbox")
  -- end,
  -- },
  -- {
  --   "sainnhe/everforest",
  --   priority = 1000,

  -- config = function()
  -- 	vim.o.background = "dark"
  -- 	vim.g.everforest_background = "hard"
  -- 	vim.cmd.colorscheme("everforest")
  -- end,
  -- },
  -- {
  --   "sainnhe/gruvbox-material",
  -- config = function()
  -- 	vim.o.background = "dark"
  -- 	vim.g.gruvbox_material_background = "hard"
  -- 	vim.cmd.colorscheme("gruvbox-material")
  -- end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = "dark"
  --     vim.cmd.colorscheme "catppuccin"
  --
  --     require("catppuccin").setup {
  --       transparent_background = true,
  --       term_colors = true,
  --     }
  --   end,
  -- },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = "dark"
      vim.g.everforest_background = "soft"
      vim.g.everforest_transparent_background = 1
      vim.cmd.colorscheme "everforest"
    end,
  },
}
