return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    signature = { enabled = true },

    completion = {
      list = { selection = "auto_insert" },
    },
    keymap = {
      preset = "super-tab",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "fallback",
      },
    },
  },
}
