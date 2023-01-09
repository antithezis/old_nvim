local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

local colors = require("themes.theme").colors
-- local injections = require("./injections.scm")

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    rainbow = {
        colors = {
            colors.red,
            colors.orange,
            colors.yellow,
            colors.green,
            colors.magenta,
            colors.cyan,
            colors.blue,
        },
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    indent = {
    enable = true,
},
textobjects = {
    lookahead = true,
    lsp_interop = {
       enable = true,
        border = 'rounded',
        peek_definition_code = {
        ['df'] = '@function.outer',
        ['dF'] = '@class.outer',
    },
},
select = {
    enable = true,
    lookahead = true,
    keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
    },
},
move = {
    enable = true,
    set_jumps = true,
    goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
},
goto_next_end = {
    [']M'] = '@function.outer',
    [']['] = '@class.outer',
},
goto_previous_start = {
    ['[m'] = '@function.outer',
    ['[['] = '@class.outer',
},
goto_previous_end = {
    ['[M'] = '@function.outer',
    ['[]'] = '@class.outer',
},
},
},
autopairs = { enable = true },

}
