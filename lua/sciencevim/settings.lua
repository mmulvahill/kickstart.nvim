-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!

vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- vim.opt.breakindent = true -- Enable break indent

vim.opt.undofile = true -- Save undo history

vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default

vim.opt.updatetime = 250 -- Decrease update time (was 100 in old config)
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time - Displays which-key popup sooner

vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.sidescrolloff = 8

vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile

vim.opt.fileencoding = "utf-8" -- the encoding written to a file

vim.opt.hlsearch = true -- highlight all matches on previous search pattern

vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
-- vim.opt.textwidth = 100                         -- set number of columns before wrapping
-- vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
--
-- vim.opt.showtabline = 2                         -- always show tabs
-- vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.expandtab = true -- convert tabs to spaces
-- vim.opt.wrap = true                             -- display lines as one long line

-- vim.opt.foldmethod = "marker",
-- vim.opt.foldmarker = "{{{,}}}",

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Other from old config
-- vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
-- vim.opt.completeopt = { "menuone" "noselect" }, -- mostly just for cmp
-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.opt.pumheight = 10                          -- pop up menu height
-- vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
-- vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.laststatus = 3,
-- vim.opt.showcmd = false,
-- vim.opt.ruler = false,
-- vim.opt.-- guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- vim.opt.title = true,
-- --formatoptions:append 'c'  -- c for autowrap comments, t for text/code
-- --colorcolumn = "80",
-- -- colorcolumn = "120",
-- --fillchars.eob = " "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
-- -- shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
-- --whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
-- --iskeyword:append("-")                   -- treats words with `-` as single words
-- --formatoptions:remove({ "c" "r", "o" }), -- This is a sequence of letters which describes how automatic formatting is to be done
-- --linebreak = true
