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
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

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
set ruler

" add by zhaocq, for tab repeace with space 
" set expandtab
"set tabstop=4
"set shiftwidth=4
" add over 

" mouse options
"set mouse=a

" color scheme
colorscheme elflord

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
