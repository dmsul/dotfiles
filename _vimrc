set nocompatible
filetype off

" Packages
  if has('win32')
    let path='~/vimfiles/bundle'
  else
    let path='~/.vim/bundle'
  endif
  call plug#begin(path)

  " Plug 'junegunn/vader.vim'

  Plug 'Valloric/YouCompleteME'
  Plug 'w0rp/ale'

  Plug 'sheerun/vim-polyglot'           " Collection of syntax highlighting
                                        " type stuff


  Plug 'AndrewRadev/linediff.vim'       " Partial file diffs

  Plug 'tpope/vim-fugitive'             " Git stuff
  Plug 'mhinz/vim-signify'

  Plug 'SirVer/ultisnips'               " See 'honza/vim-snippets' for actual snippets
  Plug 'honza/vim-snippets'

  Plug 'scrooloose/nerdtree'
  Plug 'vim-scripts/TaskList.vim'
  Plug 'majutsushi/tagbar'
  Plug 'ctrlpvim/ctrlp.vim'

  " Plug 'Lokaltog/vim-easymotion'
  " Plug 'tpope/vim-surround'
  " Plug 'godlygeek/tabular'

  " Plug 'nathanaelkane/vim-indent-guides'  " <leader>ig toggles
  Plug 'sjl/gundo.vim'


  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'idbrii/powerline-sanity'
  " Plug 'mhinz/vim-startify'
  " Plug 'bling/vim-bufferline'

  " Plug 'junegunn/seoul256.vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'gosukiwi/vim-atom-dark'

  " Latex
  Plug 'lervag/vimtex'

  " Python
  Plug 'vim-python/python-syntax'
  Plug 'tmhedberg/SimpylFold'               " Python folding (I don't like it)
  Plug 'hynek/vim-python-pep8-indent'       " python-mode's pep8 indent source
  " Plug 'davidhalter/jedi-vim'
  Plug 'python-rope/ropevim'

  " Stata
  Plug 'dmsul/vim-stata'

  call plug#end()

filetype plugin indent on

" YouCompleteMe
  let g:ycm_python_binary_path = 'python'
  let g:ycm_autoclose_preview_window_after_completion = 0
  let g:ycm_autoclose_preview_window_after_insertion = 1    " After leaving insert mode
  let g:ycm_filetype_specific_completion_to_disable = {
        \ 'gitcommit': 1,
        \ 'python': 0
        \}
  let g:ycm_filetype_blacklist = {
        \ 'tex': 1,
        \ 'latex': 1,
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1
        \}
  nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
  " nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
  " nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

" UltiSnips
  let g:UltiSnipsExpandTrigger="<c-a>"
  let g:UltiSnipsJumpForwardTrigger="<c-a>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ALE (syntax checker)
  let g:ale_enabled = 1
  let g:ale_line_on_enter = 0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters = {
              \ 'python': ['flake8', 'mypy'],
              \ 'tex': [],
              \}
  let g:ale_echo_msg_format = '%linter% says %s'
  let g:airline#extensions#ale#enabled = 1
  let g:ale_python_flake8_options = '--ignore=E302,E226,E116,E722,E701,E252,W504,W503'
  let g:ale_python_mypy_options = '--ignore-missing-imports'
  " Error codes: ?; ?; ?; Bare 'except'

" Polyglot
  let g:polyglot_disabled = ['python', 'latex', 'tex']

" AIRLINE
  let g:airline#extensions#whitespace#enabled = 0
  " let g:airline_theme = 'light'
  let g:airline_theme = 'hybrid'
  let g:airline#extensions#tabline#enabled = 0
  set encoding=utf-8
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  if has('gui')
      let g:airline_powerline_fonts = 1
      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif
      let g:airline_symbols.linenr = ''
  else
      let g:airline_symbols = {}
  endif
  let g:airline_section_y = ''
  set noshowmode

" Bufferline
  let g:bufferline_rotate = 1
  let g:bufferline_echo = 0

" NERDTree
  let g:NERDTreeIgnore=['.*\.pyc', '__pycache__']
  map <C-n> :NERDTreeToggle<CR>

" Tasklist
  " 'Align' uses '\t' mapping
  " map <leader>d <Plug>TaskList    
  let g:tlTokenList=['FIXME', 'TODO', 'XXX', 'YYY', 'CCC']

" Gundo
  nnoremap <F4> :GundoToggle<CR>

" Tagbar
  nmap <F8> :TagbarToggle<CR>
  let g:airline#extensions#tagbar#enabled = 1
  let g:tagbar_ctags_bin = '~\proj\ctags\ctags.exe'


" Python
  let g:python_highlight_all = 1
  let g:jedi#popup_on_dot = 0
  let g:SimpylFold_fold_import = 0

" LATEX
  let g:vimtex_view_method = 'general'
  let g:vimtex_view_general_viewer = 'sumatrapdf'
  let g:vimtex_view_general_options = '-reuse-instance '
    \ . '-forward-search @tex @line @pdf '
    \ . '-inverse-search '
    \ . '"gvim --servername ' . v:servername
    \ . ' --remote-silent '
    \ . '\"+\%l|normal zzzv|'
    \ . 'call remote_foreground('''.v:servername.''')\"'
    \ . ' \"\%f\""'
  let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 0,
    \}
  let g:vimtex_fold_enabled = 1
  "
  " Latex only! Hang indent the next line
          " I need <c-i> for jumplist
  nnoremap <m-i> JgqqI<space><space><Esc>         
  " nnoremap <m-i> JgqqI<space><space><Esc>gqj

" Stata
  autocmd BufRead,BufNewFile *.do setlocal foldmethod=syntax

" Display
if has('gui')
    set guioptions-=m               " Get rid of menu
    set guioptions-=T               " Get rid of buttons
    set guioptions-=r               " No right-hand scroll
    set guioptions-=L               " No left-hand scroll w/ vsplit
                                    " See https://vi.stackexchange.com/a/6336
    if has('win32')
        set rop=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:2,taamode:1
    endif
endif

" Make Meta key usable on Odyssey/NBER
" See vim wikia comments 'Fix meta keys that break...'
if has('unix')
  let c='a'
  while c <= 'z'
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif

" Folding
" set foldmethod=indent "options are 'syntax', 'indent', etc
set foldnestmax=3
set noswapfile                  " Turn off swap files (backups)
set backupcopy=auto             " When overwriting file, save as tmp file,
                                " then copy over original. Preserves symlinks!
"set backupdir-=.                " Don't write tmp files to the current dir (I think
                                " this causes problems when cwd is in
                                " Dropbox), (but I think making this addition
                                " screws up git rebase -i)

" Set font and font size
if has('win32')
  set guifont=Fira\ Code\ Retina:h12:cANSI
else
  set guifont=Ubuntu\ Mono\ 14
endif
nmap <F12> :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>
nmap <S-F12> :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>

" Colors
if has('gui')
    " colorscheme jellybeans
    colorscheme atom-dark
endif
set background=dark
syntax on

set number                      " Line numbers on left
set ruler
set laststatus=2                " Always show status line
set showmatch                   " Show matching brackets
set mat=2
set incsearch                   " Instant search
set hlsearch
set ignorecase                  " Case-sensitivity in search
set smartcase
set bs=2                        " Better backspace
set expandtab                   " Fix tabs
set smarttab
set shiftwidth=4
set softtabstop=4
set ffs=unix,dos                " Line endings
set ff=unix
set wildmode=longest,list,full  " Tab completion
set wildmenu
set wildignore=*.pyc,*.aux
set autoindent                  " Autoindent
set copyindent
set hidden                      " Don't close buffers, hide them

"
""""  Custom mappings  """"
inoremap jk <Esc>
nnoremap <C-M> :nohl<CR><C-L>
nnoremap Y y$
" Delete current buffer w/o closing window
nnoremap <m-w> :bp\|bd #<CR>
" Move across wrapped lines correctly
nnoremap j gj
nnoremap k gk
" Faster scroll
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>
" Quote words under cursor
nnoremap <leader>' viw<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l
nnoremap <leader>" viw<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
" Move a line using ALT+[jk]
nnoremap <m-j> mz:m+1<CR>`z
nnoremap <m-k> mz:m-2<CR>`z
"vmap
"vmap
"
" Change 'delete last word' so I don't close windows in other programs
inoremap <c-b> <c-w>
inoremap <c-w> <Nop>

" Navigate split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

if &shell =~ 'bash' && has('win32')
    set shell=cmd
    set shellcmdflag=/c
endif
