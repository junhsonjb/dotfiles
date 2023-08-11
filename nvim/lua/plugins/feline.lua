local feline = require('feline')

local LEFT = 1
local MIDDLE = 2
local RIGHT = 3

local mode = {
    provider = {
        name = 'vi_mode',
        opts = {
            show_mode_name = true,
        }
    },
    hl = function()
        return {
            name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            fg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold'
        }
    end,
    -- icon = '',
    right_sep = 'slant_right'
}

local branch = {
    provider = 'git_branch',
    icon = ' ',
    right_sep = ' ',
    hl = {
        fg = 'white',
        style = 'bold'
    },
}

local diff_add = {
    provider = 'git_diff_added',
    -- icon = '+',
    hl = {
        fg = 'green'
    },
    right_sep = ' ',
}

local diff_removed = {
    provider = 'git_diff_removed',
    icon = '',
    hl = {
        fg = 'red'
    },
    right_sep = ' ',
}

local diff_changed = {
    provider = 'git_diff_changed',
    icon = '柳',
    hl = {
        fg = 'yellow'
    },
    right_sep = ' ',
}

local filename = {
    provider = {
        name = 'file_info',
        opts = {
            type = 'relative'
        }
    },
    hl = {
        fg = 'white',
        style = 'bold'
    },
}

local lsp = {
    provider = 'lsp_client_names',
    icon = ' ',
    right_sep = ' '
}

local filetype = {
    provider = 'file_type',
    provider = {
        name = 'file_type',
        opts = {
            filetype_icon = true
        }
    },
    right_sep = ' '
}

local file_encoding = {
    provider = 'file_encoding',
    right_sep = ' ',
    hl = {
        style = 'italic',
    }
}

local position = {
    provider = 'position',
    left_sep = ' ',
    right_sep = ' '
}

local percentage = {
    provider = 'line_percentage',
    left_sep = ' ',
    right_sep = ' '
}

local scrollbar = {
    provider = {
        name = 'scroll_bar'
    },
    hl = {
        fg = 'white',
    },
}

local components = {
    active = {
        {},
        {},
        {},
    }
}

table.insert(components.active[LEFT], mode)
table.insert(components.active[LEFT], branch)
table.insert(components.active[LEFT], diff_add)
table.insert(components.active[LEFT], diff_removed)
table.insert(components.active[LEFT], diff_changed)

table.insert(components.active[MIDDLE], filename)

table.insert(components.active[RIGHT], lsp)
table.insert(components.active[RIGHT], filetype)
table.insert(components.active[RIGHT], file_encoding)
table.insert(components.active[RIGHT], position)
table.insert(components.active[RIGHT], percentage)
table.insert(components.active[RIGHT], scrollbar)

feline.setup {
    components = components
}
