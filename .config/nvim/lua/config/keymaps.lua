-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yannic keymaps
vim.keymap.set("i", "jk", "<Esc>", { silent = true })
--
-- Tmux Alt
if os.getenv("TMUX") then
  -- vim.g.tmux_navigator_no_mappings = 1
  vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Terminal lazy
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
vim.keymap.set("n", "<C-n>", lazyterm, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<C-n>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Crtl + / (forward slash) comment
-- Need to remove any previous mappings from it
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<C-_>")
local comment = require("Comment").setup()
comment.toggler.line = "<C-/>"
comment.opleader.line = "<C-/>"

vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })
vim.keymap.set("n", "<C-v>", '"+P', { noremap = true })
vim.keymap.set("v", "<C-v>", '"+P', { noremap = true })
vim.keymap.set("c", "<C-v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true })
vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli', { noremap = true })
vim.keymap.set("t", "<C-v>", '<C-\\><C-n>"+Pi', { noremap = true })

-- neovide scaling
if vim.g.neovide == true then
  vim.api.nvim_set_keymap(
    "n",
    "<C-a>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-x>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- end
