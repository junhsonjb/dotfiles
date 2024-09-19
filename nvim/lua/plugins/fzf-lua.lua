local actions = require("fzf-lua.actions")

require('fzf-lua').setup {
    files = {
        cmd = "gfind . -type f -printf '%P\n'"
    }
}
