# vimrc

Personal Vim configuration by [Victor Fu](mailto:supergothere@gmail.com).

## Features

- **Plugin management** via [vim-plug](https://github.com/junegunn/vim-plug) (auto-installed on first launch)
- **Syntax highlighting** for TypeScript, JSX/TSX, Go, Swift, C++, Dockerfile, Markdown, JSON, CSS3, Handlebars
- **Linting** with [ALE](https://github.com/dense-analysis/ale) (ESLint, tsserver, flake8)
- **Formatting** with [Prettier](https://github.com/prettier/vim-prettier) (auto-format on save)
- **File navigation** with [NERDTree](https://github.com/scrooloose/nerdtree) and [CtrlP](https://github.com/kien/ctrlp.vim)
- **Airline** statusline with powerline fonts and tabline
- **Sensible defaults**: 2-space indentation, dark background, cursor line highlight, smart search, system clipboard integration

## Installation

```bash
git clone https://github.com/victorfu/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
```

## Key Mappings

| Key | Action |
|-----|--------|
| `Shift+H` / `Shift+L` | Previous / next tab |
| `Ctrl+t Ctrl+t` | New tab |
| `Ctrl+t Ctrl+w` | Close tab |
| `<leader>d` | Toggle NERDTree |
| `<leader>s` | Find current file in NERDTree |
| `F2` | Toggle paste mode |
| `F7` | Toggle spell check |
| `Esc` | Clear search highlight |

## Plugins

| Category | Plugin |
|----------|--------|
| Theme | vim-airline, vim-airline-themes, molokai, vim-colorschemes |
| Syntax | yats.vim, vim-jsx-pretty, vim-javascript, vim-json, vim-css3-syntax, vim-mustache-handlebars, vim-cpp-enhanced-highlight, vim-swift, Dockerfile.vim, vim-go, vim-markdown |
| UI | vim-indent-guides, NERDTree, CtrlP |
| Editing | auto-pairs, vim-commentary, vim-closetag, html5.vim |
| Lint & Format | ALE, vim-prettier |

## Credits

Inspired by:

- [Abner's vimrc](https://github.com/houjunchen/vimrc.git)
- [Wuman's vimrc](https://github.com/wuman/vimrc.git)
