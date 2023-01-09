vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "settings"
require "keymaps"
require "plugins"
