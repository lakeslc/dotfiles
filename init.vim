"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" <Required>
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')
" </Required>

" Plugins
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('jpo/vim-railscasts-theme')
call dein#add('morhetz/gruvbox')
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('scrooloose/nerdtree.git')
call dein#add('ryanoasis/vim-devicons')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('slim-template/vim-slim.git')
call dein#add('tpope/vim-sleuth.git')
call dein#add('tpope/vim-surround.git')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-endwise')
call dein#add('dbakker/vim-projectroot')
call dein#add('christoomey/vim-tmux-runner')
call dein#add('thoughtbot/vim-rspec')
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-projectionist')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('sjl/gundo.vim')
call dein#add('Shougo/vimshell')

" <Required>
call dein#end()
filetype plugin indent on
" </Required>

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax enable
set number
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set shiftround
set expandtab
set diffopt=vertical 
set clipboard=unnamed
set background=dark
colorscheme gruvbox
set guifont=Sauce\ Code\ Pro\ Nerd\ Font:h14
set encoding=utf8
let &colorcolumn=join(range(81,999),",")
:hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"Indentation Settings
autocmd Filetype c setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd Filetype ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Key Mappings
noremap <C-Up> :lp<CR>
noremap <C-Down> :lne<CR>
nnoremap \ :ProjectRootExe :Ag<space>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" Leader Mappings
let mapleader = ","
nnoremap <leader><space> :noh<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <leader>rf :VtrFocusRunner<CR>
map <leader>ra :VtrAttachToPane<CR>
map <leader>rm :VtrSendCommand(make clean all)<CR>
map <leader>ut :GundoToggle<CR>

" The Silver Searcher Setup
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" CTRLP Setup
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Airline Setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab

" TMUX Settings
" Vertical bar in insert mode for tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Misc
autocmd BufWritePre *.py :%s/\s\+$//e