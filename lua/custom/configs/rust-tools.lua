
 local on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
end

local capabilities = require("plugins.configs.lspconfig").capabilities
-- local on_attach = require("plugins.configs.lspconfig").on_attach


local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options
