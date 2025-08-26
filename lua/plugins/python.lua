return {
  -- LSP and Linter/Formatter configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Make sure neovim-lspconfig knows about pyright
      servers = {
        pyright = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      -- Add the formatter for python files
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Ensure pyright, black, and ruff are installed
      vim.list_extend(opts.ensure_installed, { "pyright", "black", "ruff" })
    end,
  },

  -- nvim-cmp completion configuration
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- nvim-cmp uses luasnip and path sources by default.
      -- We'll add custom keymappings for completion.
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
    end,
  },
}