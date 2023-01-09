-- require ('nvim-autopairs').setup({
--         check_ts = true
--     })

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = {tex = '' } }))
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"


local _autopairs, autopairs = pcall(require, "nvim-autopairs")

if not _autopairs then
    return
end

autopairs.setup {}
