set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set termencoding=cp936
language messages zh_CN.UTF-8

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

colo freya
set guifont=Courier_New:h14:cANSI
" set nu
set ic
set hls
set expandtab
set sw=4
set tabstop=4
set cc=80
hi ColorColumn guibg=#666666
set nobackup
set noundofile

set ff=unix



" 自动透明
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)

" 几个更改alpha的快捷键
map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>
map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>
map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>

"功能:
"1,快捷键CTRL+PageUp/PageDown 改变透明度; 
"2,CTRL+F11改变置顶状态(有置顶信息提示!);
"3,F11改变切换窗口最大化; AppBay.2012-4-11
let g:vimtweakTrans=235 "定义初始透明度 0~255
let g:vimtweakTransDelta=5 "定义每次增加/减少的透明度值 0~255
let g:vimtweakTransMini=10 "定义最小的透明度 0~255
let g:vimtweakTopMost=0 "定义初始是否置顶
let g:vimtweakMaximized=0 "定义初始是否最大化
 
au GUIEnter * call libcallnr("vimtweak.dll","EnableTopMost",g:vimtweakTopMost)
au GUIEnter * call libcallnr("vimtweak.dll","SetAlpha",g:vimtweakTrans)
au GUIEnter * call libcallnr("vimtweak.dll","EnableMaximize",g:vimtweakMaximized)
 
map <C-PageUp> :let g:vimtweakTrans+=g:vimtweakTransDelta<cr>:let g:vimtweakTrans=(g:vimtweakTrans>255?255 : g:vimtweakTrans)<cr>:call libcallnr("vimtweak.dll", "SetAlpha", g:vimtweakTrans)<cr><ESC>
map <C-PageDown> :let g:vimtweakTrans-=g:vimtweakTransDelta<cr>:let g:vimtweakTrans=(g:vimtweakTrans<g:vimtweakTransMini?g:vimtweakTransMini : g:vimtweakTrans)<cr>:call libcallnr("vimtweak.dll", "SetAlpha", g:vimtweakTrans)<cr><ESC>
map <C-F11> :let g:vimtweakTopMost=(g:vimtweakTopMost?0:1)<cr>:call libcallnr("vimtweak.dll","EnableTopMost",g:vimtweakTopMost)<cr><ESC>:echo (g:vimtweakTopMost==1?"置顶":"置顶已取消")<ESC>
map <F11> :let g:vimtweakMaximized=(g:vimtweakMaximized?0:1)<cr>:call libcallnr("vimtweak.dll","EnableMaximize",g:vimtweakMaximized)<cr><ESC>:echo (g:vimtweakMaximized==1?"最大化":"最大化已取消")<ESC>


" vundle settings

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')
" call vundle#begin('B:/Vim/.vim/vimfiles/bundle/')
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'The-NERD-tree'

Plugin 'https://github.com/hoelzro/vim-polyglot'

Plugin 'VimTweak'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

