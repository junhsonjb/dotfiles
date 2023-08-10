local ts = require('nvim-treesitter.configs')

ts.setup {
    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    ensure_installed = { "vimdoc", "go", "lua", "ruby", "rust" },
}
