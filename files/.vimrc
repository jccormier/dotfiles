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
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'pangloss/vim-javascript'

Plug 'elixir-editors/vim-elixir'

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
colorscheme nord

" Encrypted file support
" command Encrypt execute '%! ~/bin/encrypt' | execute ':redraw!'
" command Decrypt execute '%! ~/bin/decrypt' | execute ':redraw!'

let mapleader=","

nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
nnoremap <Leader><Tab> <Tab>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <Leader>p :Files<SPACE>
nnoremap <silent> <Leader>l :Lines<CR>

nnoremap <silent> <Leader>si :mksession! .vim_session<CR>
nnoremap <Leader>ss :mksession! $VIMCONFIG/sessions/
nnoremap <silent> <Leader>sl :call fzf#run({'sink': 'source', 'dir': '$VIMCONFIG/sessions'})<CR>


set rtp+=$HOME/bin/fzf

let g:ackprg = 'ag -u --nogroup --nocolor --column'

autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif

autocmd VimEnter *
\  if filereadable('.vim_session')
\|   exe 'source .vim_session'
\| endif

autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))

autocmd VimLeave * call system("tmux rename-window zsh")

