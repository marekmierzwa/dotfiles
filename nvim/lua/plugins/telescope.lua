return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope find previous files" })

    -- default mappings:
    -- <C-n>/<Down>	Next item
    -- <C-p>/<Up>	Previous item
    --
    local telescope = require "telescope"

    telescope.setup {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        mappings = {
          n = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<Esc>"] = require("telescope.actions").close,
          }, -- n
        },
        file_ignore_patterns = { "node_modules" },
      },
    }
  end,
}
