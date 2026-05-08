# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for macOS (primary), Arch, Ubuntu, and RHEL. Config is symlinked into `~/.config/` by `deploy.sh`; there is no build system or test suite.

## Deploying / bootstrapping

```bash
./deploy.sh   # detects OS, installs deps, symlinks configs, switches shell to zsh
```

All output is logged to `deploy.log` (gitignored). Helper functions (`ptask`, `pinfo`, `pwarn`, `perror`, `sudo_cmd`, `user_cmd`) live in `bootstrap/lib.sh`.

To add a new symlink, add an `ln -snf` call inside `install_dotfiles()` in `bootstrap/installers.sh`.

To add a new dependency across all platforms, add it to `commonDeps` in `bootstrap/deps.sh` and write a corresponding `install_<name>()` function in `bootstrap/installers.sh` with a `case $arch in` block for each platform.

## Neovim (`nvim/`)

Uses **Neovim 0.11+ native features** — no external plugin manager. Plugins are loaded with `vim.pack.add()` (built-in). LSP is configured with the native `vim.lsp` API (no lspconfig).

### Entry points

- `nvim/init.lua` → `lua/mwasher/init.lua` → loads `mwasher.config` then `mwasher.plugins`
- `lua/mwasher/config/init.lua` — requires: utilities, options, keymaps, autocmds, lsp
- `lua/mwasher/plugins/init.lua` — requires each plugin spec under `plugins/specs/`

### Plugin specs

Each file in `lua/mwasher/plugins/specs/` is self-contained: calls `vim.pack.add()`, sets up the plugin, and registers its keymaps. Plugins in use:

| Spec file | Plugin | Purpose |
|---|---|---|
| `snacks.lua` | snacks.nvim | Picker (ivy layout), file explorer, notifier, indent, scroll |
| `conform.lua` | conform.nvim | Auto-format on save (stylua/gofumpt/ruff) |
| `blink.lua` | blink.cmp | Completion |
| `luasnip.lua` | LuaSnip | Snippets |
| `nvim-treesitter.lua` | nvim-treesitter | Syntax / parsing |
| `oil.lua` | oil.nvim | Floating file manager (`-`) |
| `mini.lua` | mini.nvim | Various mini modules |
| `monoglow.lua` | monoglow | Colorscheme |
| `arc.lua` | arc.nvim | Arc browser integration |
| `smear-cursor.lua` | smear-cursor | Cursor animation |
| `summon.lua` | summon | (custom/local) |

### LSP

Servers enabled: `lua_ls`, `gopls`, `basedpyright`. Config lives in `lua/mwasher/config/lsp.lua`; per-server options in `lua/mwasher/config/lsp-servers/`. Semantic tokens are disabled (`semanticTokensProvider = nil`). Custom commands: `LspStart`, `LspStop`, `LspRestart`, `LspLog`, `LspInfo`.

### Key bindings (non-obvious)

- Leader: `<Space>`
- `<leader><space>` — smart file picker (Snacks)
- `<leader>e` — file explorer (Snacks)
- `<leader>/` — grep (Snacks)
- `<leader>l*` — LSP actions (`lr` rename, `la` code action, `lh` inlay hints, etc.)
- `<leader>d*` — diagnostics (`dn`/`dp` next/prev, `dv` toggle virtual lines)
- `-` — Oil float
- `jk` (insert) — escape

### Lua globals

`is_linux()`, `is_darwin()`, `is_nixos()` defined in `config/utilities.lua` and available globally.

## Zsh (`zsh/`)

Symlinked to `~/.config/zsh`. Entry point is `~/.zshenv` → sets `ZDOTDIR`.

- `exports.zsh` — PATH, GOPATH, EDITOR, EZA_CONFIG_DIR
- `aliases.zsh` — replaces `ls`→eza, `cat`→bat, `vi`/`vim`→nvim when available; `aenv` activates `.venv`
- `helpers.zsh` — `git_current_branch()` for prompt; `plugin-load()` for minimal plugin management (clones from GitHub, no external manager)
- `plugins/` — gitignored; populated at runtime by `plugin-load` (zsh-autosuggestions, zsh-syntax-highlighting)

## WezTerm (`wezterm/`)

`wezterm.lua` is symlinked to `~/.config/wezterm/`. Leader key: `Alt-a`. Pane splits: `Alt-v` (horizontal), `Alt-s` (vertical). Pane navigation: `Alt-hjkl`. Font: Iosevka Nerd Font. Color scheme is a custom variant of "Mono Theme" with green `#1bfd9c` and red `#fd1b7c` accents.

## Starship (`starship/`)

`starship.toml` symlinked to `~/.config/starship.toml`. Uses a custom grey palette; only git branch/status, directory, kubernetes context, nix shell, and command duration are shown. Most language modules are disabled.

## Eza (`eza/`)

`theme.yml` symlinked to `~/.config/eza/`. Customizes eza file/dir colors.
