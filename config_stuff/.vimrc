autocmd!

" This helps NERDTree work.
set encoding=utf-8

" Terminal Preferences.
" ===================================
" For more fun see http://vimdoc.sourceforge.net/htmldoc/term.html
if has("terminfo")
  " 256 colour terminal
  set t_Co=256
else
  set t_Co=88
endif

set term=xterm-256color
set t_Co=256


set title
set titlestring=%{hostname}%F

" Show naughty columns. (http://blog.ezyang.com/2010/03/vim-textwidth/)
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd BufEnter * match OverLength /\%74v.*/
"augroup END

" ===================================================================
" Indenting 
" ===================================================================
set autoindent
" deprecated in favour of cindents.
" set smartindent
set cindent
" do magic to indent comments ;)
set cinkeys-=0#
set indentkeys-=0#

set cinoptions=>2,e0,n0,}0,^0,:2,=2,p2,t0,(2,)30,*40,+2,f0,{0,c2,u2
set cinkeys=0{,0},!^F,o,O,e,*<Return>,0#

set backspace=indent,eol,start
set clipboard=autoselect
set nocompatible
set complete=.,b,u,w,t,i,d " autocomplete buffers
set comments=s1:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,nb:>,fb:-
set dictionary=/usr/share/dict/words
set esckeys
set expandtab
set fileformat=unix
set formatoptions=cqrtl
set helpheight=0
set hidden
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set history=100

" not my usual settings but hey ho.
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ===================================================================
" Search settings.
" ===================================================================
set ignorecase
set hlsearch
set incsearch
set smartcase

set noerrorbells
set novisualbell


" Sometimes we do some different things on different hosts.
let hostname = substitute( system('hostname'), '\n', '', '')

" This gets the branch we're working on.
let artefact = substitute( system('svn info |grep URL |sed "s/.*\(artf[0-9]\+\).*/\1/"'), '\n', '', '' )


let perl_include_pod = 1
let perl_fold_blocks=1


" ===================================================================
" compatibility
" ===================================================================

set magic



" ===================================================================
" Editor behaviour
" ===================================================================

autocmd BufRead,BufNewFile *.tt2 set filetype=tt2html
autocmd BufRead,BufNewFile *.t set filetype=perl
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Use perl compiler for all *.pl *.pm and .t files.
autocmd BufNewFile,BufRead *.p? compiler perl
autocmd BufNewFile,BufRead *.t compiler perl

" What to do with new files.
if &diff 
  " we don't want to create files that weren't there.
else

  autocmd BufNewFile  *.pm        0r ~/.vim/templates/perl.pm
  autocmd BufNewFile  *.pl        0r ~/.vim/templates/perl.pl
  autocmd BufNewFile  *.t         0r ~/.vim/templates/perl.t

end




" ===================================================================
" Editor behaviour
" ===================================================================

set iskeyword=@,48-57,_,192-255,-,.,@-@
set lazyredraw
set modeline
set modelines=4
set more
set paste
set path=.,/home/bootfra/bin
set report=0
set norestorescreen
set scrolloff=0
set shiftwidth=2
set showbreak="+ "
set showcmd
set showmatch
set showmode
set smartcase
" set smartindent
set smarttab
set nostartofline
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set softtabstop=2
set tildeop
set textwidth=760000
set ttyfast
set undolevels=1000
set updatecount=100000000
set updatetime=60000000
set whichwrap=<,>,b,s
set wildchar=<TAB>

" I often type "Q!" when I mean to type "q!".
" cmap Q! q!

set shell=/bin/bash\ --init-file\ ~/.bash_profile " load shell aliases

" jump to last edited position if possible
autocmd BufRead *,.* :normal '"


" ===================================================================
"set ruler Settings.
" ===================================================================

set laststatus=2
set cmdheight=3

if &diff
  set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  colorscheme zenburn
  "colorscheme elflord
  syntax off

else
  "about the only colorscheme to set cterm settings as well as gui.
  colorscheme jellybeans
endif


"define 3 custom highlight groups
hi User1 cterm=none ctermbg=green ctermfg=black   guibg=yellow guifg=black
hi User2 cterm=none ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
hi User3 cterm=none ctermbg=blue  ctermfg=green guibg=blue  guifg=green

let vsl=0

function! StatusLineToggle()

  if vsl == 1

    set statusline=
    set statusline+=%1*  "switch to User1 highlight
    set statusline+=[%{artefact}]
    set statusline+=%2*  "switch to User2 highlight
    set statusline+=%F%m%r%h%w

    let vsl=0
  
  else

    set statusline=
    set statusline+=%1*  "switch to User1 highlight
    set statusline+=[%{artefact}]
    set statusline+=%2*  "switch to User2 highlight
    set statusline+=%F%m%r%h%w[%{&ff}]%y[%p%%]
    set statusline+=%3*  "switch to User3 highlight
    set statusline+=[%04l,%04L,%04v]

    let vsl=1
  
  endif

endfunction


set tags+=./tags
"set mouse=a
set mouse=nv
set viminfo='50,\"1000,:100
set wildmenu
set wildmode=longest,full

" configuration of the taglist plugin
" ====================================
  let Tlist_Ctags_Cmd = 'ctags'
  let Tlist_Key = '<f8>'
  let Tlist_Compact_Format = 1
  let Tlist_Sync_Key = '<f9>'
  let Tlist_Sort_Type = "name"
  let Tlist_Exit_OnlyWindow = 1
  "let Tlist_Use_Horiz_Window = 1
  "let Tlist_Use_Left_Window = 1
  let Tlist_Use_Right_Window = 1
  let Tlist_Use_SingleClick = 1
  let Tlist_Use_One_Window = 1
  let Tlist_Auto_Update = 1
  let Tlist_Auto_Refresh = 1
  let Tlist_Auto_Open = 0
  let Tlist_Display_Prototype = 1
  let Tlist_Inc_Winwidth = 0
  let Tlist_WinWidth = 40
  let TlistHighlightTag = 1


" Wrap the tab key for indenting and completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endf


" ===================================================================
" Function Key Mappings
" ===================================================================



" FUNCTION KEY CLUSTER 1. (navigation)
" ====================================

" <F1> Toggle my NerdTree
nnoremap <silent> <F1> :NERDTreeToggle<CR>

" <F2> Set taglist toggle.
nnoremap <silent> <F2> :TlistToggle<CR>

" <F3>
nnoremap <silent> <F3> :call StatusLineToggle()<CR>

" <F4> Set line numbers.
set number
set nonumber
nnoremap <silent> <F4> :set nonumber!<CR>




" FUNCTION KEY CLUSTER 2. (nature)
" ================================

" <F5> Toggle line ends.
nnoremap <silent> <F5> :set list!<CR>

" <F6> Alpha sort a complete line 
noremap <F6> execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" <F7> Toggle Syntax highlighting.
syntax on
nmap <silent> <F7> :set syntax!<CR>

" <F8> Show line-ends




" FUNCTION KEY CLUSTER 2. (action)
" ================================


" <F9> Rebuild the taglist.

" <F10>

" <F11>
map <F11> :!ctags -R -f $HOME/.vim/tags/dap
"nnoremap <F11> <C-R>"=Artf()"<CR>P
"inoremap <F11> <C-R>=Artf()<CR>P

" <F12> Add make script here.
map <F12> :!tools/build_local.sh<cr>




" ===================================================================
" End of Function Key Mappings
" ===================================================================


nmap <S-F1> :!perl -w %<CR>

" These lines are really here for the benefit of cfengine
" which had a habit of inadvertently distributing vim temp files.
if hostname == "loninengeipvm07"
  set backup
  set backupdir=~/.vim/backup
  set directory=~/.vim/tmp
else
  set nobackup
endif

" Run perldoc -m on the module under the cursor
function! Perlsrc()
    let l:kname = expand('<cword>')
    execute "!perldoc -m " . l:kname
endf


"let mysyntaxfile = '~/.vim/syntax/diary.vimrc'
"au! Syntax diary source ~/.vim/syntax/diary.vim
"autocmd! BufRead,BufNewFile 20*  setfiletype diary
" set tab spacing and some macros here.


