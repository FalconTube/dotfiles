return {
  "nvim-telescope/telescope.nvim",
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        -- ["<A-j>"] = "move_selection_next",
        -- ["<A-k>"] = "move_selection_previous",
      },
    },
  },
  -- keys = {
  --   -- disable the keymap to grep files
  --   { "<leader>/", false },
  --   -- change a keymap
  --   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  --   -- add a keymap to browse plugin files
  --   {
  --     "<leader>fp",
  --     function()
  --       require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
  --     end,
  --     desc = "Find Plugin File",
  --   },
  -- },
}
