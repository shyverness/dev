let mapleader = " "

set clipboard=unnamedplus

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:vimwiki_smartCR = 0
let g:vimwiki_key_mappings = { 'all_maps': 0 }

augroup filetype_keymaps
  autocmd!
  autocmd FileType vimwiki nnoremap <buffer> <leader>l :VimwikiFollowLink<CR>
  autocmd FileType vimwiki nnoremap <buffer> <leader>sl :VimwikiSplitLink<CR>
  autocmd FileType vimwiki nnoremap <buffer> <leader>bl :VimwikiBacklinks<CR>
augroup END

set comments=""
set cmdheight=1
set conceallevel=0
set encoding=utf-8
set fileencoding=utf-8
set formatoptions=tcroqn
set guicursor=a:block-Cursor,i:ver30-iCursor,r-cr:hor20-Cursor
set mouse=nv
set switchbuf=usetab
set wildignorecase

set ttimeout
set ttimeoutlen=25 " sets the timeout after pressing escape and
                      " exiting visual mode

filetype plugin on " this is just a pain to deal with some filetypes
"                  " especially with the indents, so not using it for now
" syntax on

set termguicolors
set background=dark
colorscheme gruber-darker

" set background=light
" colorscheme zellner

" highlight Cursor guifg=#000000 guibg=#ec5d2a

set number
" set relativenumber

set tabstop=8
set shiftwidth=8
set nosmartindent
set noautoindent
set noexpandtab

set nowrap
let &showbreak = '\-'

set noswapfile
set nobackup

set hlsearch
set incsearch

set scrolloff=3
set isfname+=@-@
set signcolumn=no
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=99
set cursorline
set colorcolumn=72,80,120,180
set textwidth=72

set list
let &listchars='tab:> ,trail:*,space:·,nbsp:⍽'

highlight default Nbsp guibg=#666666 guifg=#ffffff

set ignorecase
set smartcase
set nospell
set spelllang=en,fr,cjk

augroup TrimTrailingWhitespace
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
augroup END

nnoremap <Enter> <Nop>
nnoremap <ESC> <Cmd>noh<CR>
nnoremap <leader>sa ggVG
nnoremap ! :!
vnoremap ! :!
nnoremap <leader>w <Cmd>write<CR>
nnoremap - 0
vnoremap - 0
xnoremap - 0
nnoremap ; :
vnoremap ; :
xnoremap ; :
nnoremap : ;
vnoremap : ;
xnoremap : ;
nnoremap j gj
vnoremap j gj
xnoremap j gj
nnoremap k gk
vnoremap k gk
xnoremap k gk
nnoremap R gR
vnoremap R gR
xnoremap R gR
nnoremap <leader>cz :center<CR>
vnoremap <leader>cz :center<CR>
xnoremap <leader>cz :center<CR>

nnoremap <leader>sk :make<CR>

nnoremap ç :Ex<CR>

nnoremap <leader>y :call OpenPDF()<CR>

function! OpenPDF()
  let l:pdf = expand('%:p:r') . '.pdf'
  call job_start(['zathura', l:pdf], {'stoponexit': ''})
endfunction
