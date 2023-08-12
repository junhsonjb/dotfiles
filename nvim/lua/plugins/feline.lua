local feline = require('feline')
local vi_mode = require('feline.providers.vi_mode')
local lsp_provider = require('feline.providers.lsp')
local git = require('feline.providers.git')

local ctp_feline = require('catppuccin.groups.integrations.feline')
local colors = require("catppuccin.palettes").get_palette()

-- The catppuccin library doesn't make this public so I had to copy it in.
-- Not ideal but whatever.
-- (should put this in it's own file and require it in!)
mode_colors = {
    ["n"] = { "NORMAL", colors.lavender },
    ["no"] = { "N-PENDING", colors.lavender },
    ["i"] = { "INSERT", colors.green },
    ["ic"] = { "INSERT", colors.green },
    ["t"] = { "TERMINAL", colors.green },
    ["v"] = { "VISUAL", colors.flamingo },
    ["V"] = { "V-LINE", colors.flamingo },
    ["�"] = { "V-BLOCK", colors.flamingo },
    ["R"] = { "REPLACE", colors.maroon },
    ["Rv"] = { "V-REPLACE", colors.maroon },
    ["s"] = { "SELECT", colors.maroon },
    ["S"] = { "S-LINE", colors.maroon },
    ["�"] = { "S-BLOCK", colors.maroon },
    ["c"] = { "COMMAND", colors.peach },
    ["cv"] = { "COMMAND", colors.peach },
    ["ce"] = { "COMMAND", colors.peach },
    ["r"] = { "PROMPT", colors.teal },
    ["rm"] = { "MORE", colors.teal },
    ["r?"] = { "CONFIRM", colors.mauve },
    ["!"] = { "SHELL", colors.green },
}

local function get_mode_color()
    local mode_color = mode_colors[vim.fn.mode()]
    if mode_color == nil then
        return colors.rosewater
    end
    return mode_color[2]
end

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
            name = vi_mode.get_mode_highlight_name(),
            fg = colors.crust,
            bg = get_mode_color(),
            style = 'bold'
        }
    end,
    icon = '  ',
    right_sep = 'slant_right'
}

local branch = {
    provider = function()
        local branch = git.git_branch()
        if #branch > 0 then
            return branch .. ' '
        else
            return ''
        end
    end,
    icon = ' ',
    left_sep = 'slant_left_2',
    right_sep = 'slant_right',
    hl = {
        fg = colors.crust,
        bg = colors.rosewater,
        style = 'bold'
    },
}

local diff_add = {
    provider = 'git_diff_added',
    icon = ' ',
    hl = {
        fg = 'green'
    },
    left_sep = ' ',
    right_sep = ' ',
}

local diff_removed = {
    provider = 'git_diff_removed',
    -- I literally couldn't find a minus sign that looked good
    -- And then copilot gave it to me
    -- And then wrote the first line of this comment
    -- And then finished that comment. That is very scary.
    -- I had to close my eyes to write this comment so that it woudn't finish it for me.
    -- Keeping the comment below just in case I ever need the icon. Since I can't find it online.
    -- icon = ' ',
    icon = ' ',
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

-- Add components for diagnostic errors, warnings, hints, and info
local diagnostic_errors = {
    provider = 'diagnostic_errors',
    enabled = function()
        return lsp_provider.diagnostics_exist('ERROR')
    end,
    hl = {
        fg = colors.red
    },
    icon = ' ',
    right_sep = ' ',
}

local diagnostic_warnings = {
    provider = 'diagnostic_warnings',
    enabled = function()
        return lsp_provider.diagnostics_exist('WARN')
    end,
    hl = {
        fg = colors.yellow
    },
    icon = ' ',
    right_sep = ' ',
}

local diagnostic_hints = {
    provider = 'diagnostic_hints',
    enabled = function()
        return lsp_provider.diagnostics_exist('HINT')
    end,
    hl = {
        fg = colors.cyan
    },
    icon = ' ',
    right_sep = ' ',
}

local diagnostic_info = {
    provider = 'diagnostic_info',
    enabled = function()
        return lsp_provider.diagnostics_exist('INFO')
    end,
    hl = {
        fg = colors.blue
    },
    icon = ' ',
    right_sep = ' ',
}

local lsp = {
    provider = 'lsp_client_names',
    icon = ' ',
    left_sep = 'slant_left',
    right_sep = 'slant_right_2',
    hl = {
        fg = colors.crust,
        bg = colors.rosewater,
    }
}

local position = {
    provider = 'position',
    left_sep = 'slant_left',
    right_sep = 'slant_right_2',
    hl = {
        fg = colors.crust,
        bg = colors.rosewater,
    }
}

local percentage = {
    provider = 'line_percentage',
    left_sep = ' ',
    right_sep = ' ',
    hl = {
        style = 'bold'
    }
}

local scrollbar = {
    provider = {
        name = 'scroll_bar',
        opts = {
            reverse = true
        }
    },
    right_sep = ' ',
    hl = {
        bg = colors.crust,
        fg = colors.rosewater,
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

table.insert(components.active[RIGHT], diagnostic_errors)
table.insert(components.active[RIGHT], diagnostic_warnings)
table.insert(components.active[RIGHT], diagnostic_hints)
table.insert(components.active[RIGHT], diagnostic_info)
table.insert(components.active[RIGHT], lsp)
table.insert(components.active[RIGHT], position)
table.insert(components.active[RIGHT], percentage)
table.insert(components.active[RIGHT], scrollbar)

feline.setup {
    components = components,
}
