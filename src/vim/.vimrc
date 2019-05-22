" ----------------------------------------------------------------------
" | Vim packages                                                       |
" ----------------------------------------------------------------------
packadd! onedark.vim


" ----------------------------------------------------------------------
" | Configuration                                                      |
" ----------------------------------------------------------------------
set nocompatible               " Don't make Vim vi-compatibile.

syntax on                      " Enable syntax highlighting.
if has("autocmd")
  filetype plugin indent on
  "           │     │    └──── Enable file type detection.
  "           │     └───────── Enable loading of indent file.
  "           └─────────────── Enable loading of plugin files.
endif

set autoindent                 " Copy indent to the new line.

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode.

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register.
  set clipboard+=unnamedplus   " │
endif                          " ┘

" set colorcolumn=73             " Highlight certain column(s).
set cursorline                 " Highlight the current line.
set encoding=utf-8 nobomb      " Use UTF-8 without BOM.
set history=5000               " Increase command line history.
set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set laststatus=2               " Always show the status line.

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

set list
set listchars=tab:→\           " ┐
set listchars+=eol:¬           " │
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=space:·         " │ represent invisible characters.
set listchars+=nbsp:·          " ┘


set magic                      " Enable extended regexp.
set mousehide                  " Hide mouse pointer while typing.
set noerrorbells               " Disable error bells.

set nobackup                   " ┐
set nowritebackup              " │ Disable stupid backup and swap files
set noswapfile                 " ┘

set nostartofline              " Kept the cursor on the same column.
set number                     " Show line number.

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`.

set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position.

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen.

set shortmess=aAItW            " Avoid all the hit-enter prompts.
set showcmd                    " Show the command being typed.
set showmode                   " Show current mode.
set spelllang=en_us            " Set the spellchecking language

set splitright                 " More natural splitting

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines).

set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘

set ttyfast                    " Enable fast terminal connection.
set virtualedit=all            " Allow cursor to be anywhere.

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).

set winminheight=0             " Allow windows to be squashed.



" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good
                               " on a dark background.

colorscheme onedark            " Use custom color scheme.


" ----------------------------------------------------------------------
" | Status Line                                                        |
" ----------------------------------------------------------------------

" Terminal types:
"
"   1) term  (normal terminals, e.g.: vt100, xterm)
"   2) cterm (color terminals, e.g.: MS-DOS console, color-xterm)
"   3) gui   (GUIs)

highlight ColorColumn
  \ term=NONE
  \ cterm=NONE  ctermbg=237    ctermfg=NONE
  \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLine
  \ term=NONE
  \ cterm=NONE  ctermbg=235  ctermfg=NONE
  \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLineNr
  \ term=bold
  \ cterm=bold  ctermbg=NONE   ctermfg=178
  \ gui=bold    guibg=#073642  guifg=Orange

highlight LineNr
  \ term=NONE
  \ cterm=NONE  ctermfg=241    ctermbg=NONE
  \ gui=NONE    guifg=#839497  guibg=#073642

highlight User1
  \ term=NONE
  \ cterm=NONE  ctermbg=237    ctermfg=Grey
  \ gui=NONE    guibg=#073642  guifg=#839496

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set statusline=
set statusline+=%1*            " User1 highlight
set statusline+=\ [%n]         " Buffer number
set statusline+=\ %{GetGitBranchName()}        " Git branch name
set statusline+=\ [%f]         " File path
set statusline+=%m             " Modified flag
set statusline+=%r             " Readonly flag
set statusline+=%h             " Help file flag
set statusline+=%w             " Preview window flag
set statusline+=%y             " File type
set statusline+=[
set statusline+=%{&ff}         " File format
set statusline+=:
set statusline+=%{strlen(&fenc)?&fenc:'none'}  " File encoding
set statusline+=]
set statusline+=%=             " Left/Right separator
set statusline+=%c             " Current column number
set statusline+=,
set statusline+=%l             " Current line number
set statusline+=/
set statusline+=%L             " Total number of lines
set statusline+=\ (%P)\        " Percent through file

" Example result:
"
"  [1] [master] [vim/vimrc][vim][unix:utf-8]            17,238/381 (59%)
