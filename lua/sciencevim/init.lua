-- From previous config. Learn what this does/why
-- disable netrw at the very start of your init.lua (strongly advised)
vim.loader.enable()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- Load configs
require("sciencevim.settings")
require("sciencevim.autocommands")
require("sciencevim.keymaps")
require("sciencevim.lazy_init")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
