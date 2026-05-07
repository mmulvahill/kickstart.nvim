# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim config forked from kickstart.nvim and modularized. Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Entry chain

1. `init.lua` → `require("sciencevim")`
2. `lua/sciencevim/init.lua` loads, in order: `settings`, `autocommands`, `keymaps`, `lazy_init`
3. `lua/sciencevim/lazy_init.lua` bootstraps lazy.nvim and auto-imports two spec directories:
   - `sciencevim.lazy` — one file per plugin (`treesitter.lua`, `colorscheme.lua`, ...)
   - `sciencevim.lazy.lsp` — LSP-related specs (`lspconfig.lua`, `cmp.lua`, `conform.lua`, `lazydev.lua`)

To add a plugin, drop a new `lua/sciencevim/lazy/<name>.lua` (or `lazy/lsp/<name>.lua`) returning a lazy.nvim spec table — the auto-import picks it up. No manual registration.

`lua/sciencevim/lazy/lsp.lua` is mostly **commented-out kickstart bones**, kept as a reference. The active LSP setup is in `lazy/lsp/`.

## Plugin lockfile

`lazy-lock.json` is committed and pins each plugin to a specific commit + branch. After running `:Lazy sync` / `:Lazy update`, commit the lockfile changes.

## Version constraints (important)

- **Neovim**: 0.11.x. The user is on 0.11.5; `vim.list.unique` and other 0.12 APIs do not exist.
- **nvim-treesitter is pinned to the `master` branch** (maintenance mode). The new `main` branch requires Neovim 0.12+ and will fail at install with `attempt to index field 'list' (a nil value)` on 0.11. Do not switch to `main` without first confirming the user has upgraded Neovim.

## LSP / formatters / linters

Configured in `lua/sciencevim/lazy/lsp/lspconfig.lua`. Mason auto-installs the listed servers and tools.

- LSP servers: `pyright` (Python types only — `analysis.ignore = { "*" }` disables linting because Ruff handles it), `ruff` (Python lint/format), `lua_ls`.
- Formatters via `conform.nvim` (`lazy/lsp/conform.lua`):
  - `lua` → `stylua`
  - `python` → `ruff_format`, `ruff_fix`, `ruff_organize_imports`
  - `R` → `styler`
- Format on save is enabled for everything except `c` and `cpp`. Manual format: `<leader>f`.

## Indentation reality

`settings.lua` sets `expandtab = true` with `shiftwidth = tabstop = softtabstop = 4`. **However**, existing Lua files under `lua/sciencevim/lazy/` are formatted with **tabs** because there is no `.stylua.toml` and stylua defaults to tabs. When editing existing files, match the file's existing indentation. New files written by stylua will use tabs. `vim-sleuth` is present but disabled (`enabled = false` in `lazy/vim_sleuth.lua`) to avoid auto-detecting indentation per buffer.

## Conventions

- snake_case for variables and functions
- Section headers use `-- [[ Section Name ]]`
- `pcall` for optional plugin extensions
- Autocommands defined with `vim.api.nvim_create_autocmd` and a clear `desc`
