local M = {}


M.disabled = {
  n = {
    ["<leader>b"] = "",
  },
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "󰔱 Toggle nvimtree" },
  },
  i = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "󰔱 Toggle nvimtree" },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.rusttools = {
  n = {
    ["<leader>rcc"] = {
      function ()
        require'rust-tools'.open_cargo_toml.open_cargo_toml()
      end,
      "Open Cargo.toml file"
    },
  },
}

M.minimap = {
  n = {
    ["<leader>mm"] = {
      function()
        require("codewindow").toggle_minimap()
      end,
      " Toggle minimap",
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "󱡁 Harpoon Add file",
    },
    ["<leader>ta"] = { "<cmd>Telescope harpoon marks<CR>", "󱡀 Toggle quick menu" },
    ["<leader>hb"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "󱠿 Harpoon Menu",
    },
    ["<leader>1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "󱪼 Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "󱪽 Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "󱪾 Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "󱪿 Navigate to file 4",
    },
  },
}

return M
