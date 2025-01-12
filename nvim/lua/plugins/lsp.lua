-- require('lspconfig').solargraph.setup {} (this is the original, below
-- is the code that takes this concept and allows us to programmatically
-- apply it to several LSP servers in a reusable way)
local nvim_lsp = require('lspconfig')
local servers = { 'solargraph', 'gopls', 'pyright', 'rust-analyzer'}

local on_attach_fn = function(client, buf_number) 

    local keymap = function(keys, command)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(buf_number, 'n', keys, command, opts)
    end

    keymap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    keymap('K',  '<cmd>lua vim.lsp.buf.hover()<cr>')

end

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach_fn
    }
end

