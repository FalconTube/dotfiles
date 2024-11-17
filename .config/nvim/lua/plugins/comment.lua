if vim.g.neovide then
  return {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      toggler = {
        line = "<C-/>",
      },
      opleader = {
        line = "<C-/>",
      },
    },
  }
else
  return {
    -- Check if neovide or not
    {
      "numToStr/Comment.nvim",
      lazy = false,
      opts = {
        toggler = {
          line = "<C-_>",
        },
        opleader = {
          line = "<C-_>",
        },
      },
    },
  }
end
