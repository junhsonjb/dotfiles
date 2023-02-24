local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

      -- My own added keymaps
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
      vim.keymap.set("n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>")
      
      -- TODO:
      -- this on_attach function is somewhat duplicated from the one in 
      -- `lsp.lua`. Instead we can define a central one and then refer to it
      -- both here and in `lsp.lua`. Work on that!

    end,
  },
})
