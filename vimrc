set nocompatible " be iMproved, required
filetype off	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begine('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end
" plugin on Github repo
Plugin 'tpope/vim-fugitive'
"pulgin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
"Git plugin not hosted on Github
Plugin 'git://git.wincent.com/command-t.git'
"git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file://home/gmarik/path/to/plugin'
"The sparkup vim script is in a subdirectory of this repo called vimo"pass the
"path to set the runtimepath proprely.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Avoid a name confilit with L9
"Plugin 'user/L9', {'name': 'newL9'}
"add plugin at here
Plugin 'bufexplorer.zip'
Plugin 'bufferlist.vim'
Plugin 'taglist.vim'

"All of your Plugins must be added before the following line
call vundle#end()	"required
filetype plugin indent on "required"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief Help
" :PluginList -lists configured plugins
" :PluginInstall -installs plugins; append `!` to update or just :
" PluginUpdate
" :PluginSearch foo -searches for foo; append `!` to refreash local cache
" :PluginClean -confirms removal of unused plugins; append `!` to auto-approve
" remove
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

"for search ignore case
set ignorecase
"add for status line
set laststatus=2
highlight StatusLine ctermfg=yellow ctermbg=blue
function! CurDir()
	let curdir = substitute(getcwd(),$HOME,"~","g")
	return curdir
endfunction
set statusline=[%n]\ %F%m%r%h\ \|\ CWD:\ %r%{CurDir()}%h\ \|\ \%=\|\ line=%l/%L:%c\ \|\ %b

set nocompatible	" Use Vim defaults (much better!)
"set backup		" keep a backup file
set ruler		" show the cursor position all the time
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set encoding=utf-8
set nu
" editor format
set autoindent
set tabstop=4
set shiftwidth=4
set backspace=2
set incsearch
"set mouse=a " mouse options
colorscheme elflord " color scheme
syntax enable

filetype plugin on
filetype indent on

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex" 

" bufExplorer
let g:bufExplorerSplitBelow=1
let g:bufExplorerSortBy='name'
let g:bufExplorerSplitHorzSize=12
let g:bufExplorerUseCurrentWindow=1
let g:bufExplorerSplitOutPathName=0

" ctags & cscope options
set tags=./tags,tags
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

" key mappings for cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :cw<CR>

" nmap taglist
nmap <silent> <F8> <ESC>:Tlist<RETURN>
nmap <silent> <F5> <ESC>:TlistUpdate<RETURN>
" taglist options
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=0
let Tlist_File_Fold_Auto_Close=1

" txtbowser
syntax on
filetype plugin on
au Bufread,BufNewFile *.txt setlocal ft=txt

"F7 insert curent date & myname
"should use this in insert mode
imap <F7> <c-r>=strftime("%Y-%m-%d %H:%M:%S zhaocq")<cr>

"add for minibufexplorer 2014-06-25 10:23:35 zhaocq
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
