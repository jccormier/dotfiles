syntax enable

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-line'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'pangloss/vim-javascript'

call plug#end()

filetype plugin indent on
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set wrap linebreak nolist

set number
set numberwidth=5
" set relativenumber
set hidden
set scrolloff=999

set exrc
set secure

set shell=zsh\ --login

set t_Co=256
set termguicolors
set background=dark
colorscheme jcormier

" Encrypted file support
command Encrypt execute '%! ~/bin/encrypt' | execute ':redraw!'
command Decrypt execute '%! ~/bin/decrypt' | execute ':redraw!'

nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
nnoremap <Leader><Tab> <Tab>

nmap <silent> ,b :Buffers<CR>
nmap <silent> ,f :Files<CR>
nmap <silent> ,l :Lines<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'

autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif

autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))

autocmd VimLeave * call system("tmux rename-window bash")

