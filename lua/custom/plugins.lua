local plugins = {
-- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"rust", "lua"},
    },
  },
  {
    "chikko80/error-lens.nvim",
    ft = "rust",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
  },
 {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
      },
    },
    {
      "simrat39/rust-tools.nvim",
      ft = "rust",
      dependencies = "neovim/nvim-lspconfig",
      opts = function ()
        return require "custom.configs.rust-tools"
      end,
      config = function(_, opts)
        require('rust-tools').setup(opts)
      end
    },
    {
      'saecki/crates.nvim',
      ft = {"rust", "toml"},
      config = function(_, opts)
        local crates  = require('crates')
        crates.setup(opts)
        require('cmp').setup.buffer({
          sources = { { name = "crates" }}
        })
        crates.show()
        require("core.utils").load_mappings("crates")
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      opts = function()
        local M = require "plugins.configs.cmp"
        local cmp = require('cmp')
        M.completion.completeopt = "menu,menuone,noselect"
        M.mapping["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        }
        table.insert(M.sources, {name = "crates"})
        return M
      end,
    },
    {
      "ThePrimeagen/harpoon"
    },
    {
      "nvim-telescope/telescope.nvim",

      opts = {
        extensions_list = { "themes", "terms", "harpoon" },
        extensions = {
        },
      },
    },
    {
      "gorbit99/codewindow.nvim",
      keys = { "<leader>mm" },
      config = function()
        require("codewindow").setup {
          show_cursor = false,
          window_border = "rounded",
        }
      end,
    }, 
  }

}

return plugins
