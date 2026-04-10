<h1 align="center">
  <code>~/.vim</code>
</h1>

<p align="center">
  <b>Opinionated Vim config for polyglot developers.</b><br>
  TypeScript &middot; Swift &middot; C++ &middot; Python &middot; Web
</p>

<p align="center">
  <img src="https://img.shields.io/badge/plugin_manager-vim--plug-blue?style=flat-square" alt="vim-plug">
  <img src="https://img.shields.io/badge/LSP-sourcekit--lsp_%7C_tsserver-green?style=flat-square" alt="LSP">
  <img src="https://img.shields.io/badge/lint-ALE-orange?style=flat-square" alt="ALE">
  <img src="https://img.shields.io/badge/format-Prettier-ff69b4?style=flat-square" alt="Prettier">
</p>

---

## Quick Start

```bash
git clone https://github.com/victorfu/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
```

> vim-plug auto-installs on first launch if missing.

## Architecture

```
Syntax          LSP                  Lint / Format        UI
─────────────   ──────────────────   ──────────────────   ──────────────
TypeScript      vim-lsp              ALE (eslint,         NERDTree
JSX/TSX         vim-lsp-settings       tsserver, flake8)  fzf + ripgrep
Swift           asyncomplete         Prettier (on save)   airline + tabline
C++ / Python    (sourcekit-lsp,                           indent-guides
Dockerfile        tsserver, …)                            gitgutter signs
Markdown/JSON
```

## Key Bindings

#### LSP

| Key | Action |
|-----|--------|
| `gd` | Definition |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |

#### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+p` | Find files (fzf) |
| `<leader>f` | Ripgrep search |
| `<leader>b` | Buffer list |
| `<leader>d` | Toggle NERDTree |
| `<leader>s` | Reveal file in NERDTree |
| `Shift+H/L` | Prev / next tab |

#### Editing

| Key | Action |
|-----|--------|
| `F2` | Toggle paste mode |
| `F7` | Toggle spell check |
| `Esc` | Clear search highlight |

## Plugin Stack

| Layer | Plugins |
|-------|---------|
| **Theme** | airline, molokai, vim-colorschemes |
| **Syntax** | yats.vim, vim-jsx-pretty, vim-javascript, vim-json, vim-css3-syntax, vim-cpp-enhanced-highlight, swift.vim, Dockerfile.vim, vim-markdown, vim-mustache-handlebars |
| **LSP** | vim-lsp, vim-lsp-settings, asyncomplete.vim |
| **Editing** | vim-surround, vim-commentary, vim-repeat, auto-pairs, vim-highlightedyank, editorconfig-vim, vim-closetag, html5.vim |
| **Git** | vim-fugitive, vim-gitgutter |
| **Lint** | ALE, vim-prettier |
| **UI** | NERDTree, fzf, vim-indent-guides |

## Defaults

```
indent     2 spaces (4 for Python)    clipboard   system
search     smart case, incremental    undo        persistent (~/.vim/undodir)
encoding   UTF-8                      signs       always visible
format     unix line endings          cursorline  active window only
```

## Credits

Built on ideas from [Abner](https://github.com/houjunchen/vimrc) and [Wuman](https://github.com/wuman/vimrc).
