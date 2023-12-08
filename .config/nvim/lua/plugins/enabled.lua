return {

  {
    -- Theme inspired by Atom
    "tanvirtin/monokai.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("monokai_pro")
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      toggler = {
        ---Line-comment toggle keymap
        line = "<C-_>",
        ---Block-comment toggle keymap
        -- block = '<C-_>',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {

        ---Line-comment keymap
        line = "<C-_>",
        ---Block-comment keymap
        -- block = '<C-_>',
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
  -- Minimal configuration
  {
    "David-Kunz/gen.nvim",
    opts = {
      -- model = "deepseek-coder:vram", -- The default model to use.
      model = "neural-chat", -- The default model to use.
      -- model = "mistral", -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = true, -- Shows the Prompt submitted to Ollama.
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      -- init = function(options)
      --   pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      -- end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11435/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = "<function>", -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
  },
  {
    {
      "linux-cultist/venv-selector.nvim",
      cmd = "VenvSelect",
      opts = function(_, opts)
        if require("lazyvim.util").has("nvim-dap-python") then
          opts.dap_enabled = true
        end
        return vim.tbl_deep_extend("force", opts, {
          name = {
            "venv",
          },
        })
      end,
      keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    },
  },
}
