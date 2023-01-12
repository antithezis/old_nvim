vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "settings"
require "keymaps"
require "plugins"

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
 

-- if is_mac then
--   -- require('craftzdog.macos')
--   print(is_mac, "jueputaa")
-- end
-- if is_win then
--   -- require('craftzdog.windows')
--   print(is_win)
-- end
