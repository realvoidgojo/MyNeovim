return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = { "neovim/nvim-lspconfig", "mason.nvim" },
    config = function()
      -- Let nvim-jdtls automatically find the jdtls server installed with mason.
      require("jdtls").start_or_attach({
        -- The filetypes that trigger this server
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

        settings = {
          java = {},
        },

        on_attach = function(client, bufnr)
          -- Disable formatting from jdtls to use conform.nvim instead
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    -- Extend existing conform.nvim config
    ---@param opts conform.options
    opts = function(_, opts)
      -- Add the formatter for java files
      opts.formatters_by_ft.java = { "google_java_format" }
    end,
  },
}
