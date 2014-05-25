"{{{Auto Commands

" We love UTF-8
set enc=utf-8

" Define <Leader>
let mapleader = ","

"NerdTree
"Open NerdTree if openning files without arguments
autocmd vimenter * if !argc() | NERDTree | endif
"Close vim if only nerdtree open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Load Pathogen
call pathogen#infect()

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"}}}

"{{{Misc Settings

"Set login interactive shell
"set shell=/bin/zsh\ -li

" Necesary  for lots of cool vim things
set nocompatible

"Set shortmessage
set shortmess=atoOI

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

"Keep a 10line/col buffer on scrolling
set scrolloff=10
set sidescrolloff=10

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab
set ts=4

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
compiler gcc

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"{{{Look and Feel

" Favorite Color Scheme
set background=dark
if has("gui_running")
   colorscheme solarized
   " Remove Toolbar
   set guioptions-=T
   "Terminus is AWESOME
   set guifont=Terminus\ 9
else
   colorscheme ir_black
endif

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" }}}

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction

"}}}

"{{{Theme Rotating
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      let colorstring = "inkpot#ron#blue#elflord#evening#koehler#murphy#pablo#desert#torte#"
      let x = match( colorstring, "#", g:themeindex )
      let y = match( colorstring, "#", x + 1 )
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring, x + 1, y - x - 1)
         return ":colorscheme ".themestring
      endif
   endwhile
endfunction
" }}}

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"{{{ Todo List Mode

function! TodoListMode()
   e ~/.todo.otl
   Calendar
   wincmd l
   set foldlevel=1
   tabnew ~/.notes.txt
   tabfirst
   " or 'norm! zMzr'
endfunction

"}}}

"}}}

"{{{ Mappings

"Skim pdfSync
map <silent> <Leader>lk :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" Open Nerd Tree
nnoremap <Leader>r :NERDTreeToggle<CR>

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()<CR>

" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>

" Open the Project Plugin
nnoremap <silent> <Leader>pal  :Project .vimproject<CR>

" Zen Coding Activators
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" TODO Mode
nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :TlistToggle<CR>

"{{{ Tabs
" Ctrl + T opens new tab
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
nnoremap <silent> <C-t> :tabnew<CR>:e
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

"}}}

" Rotate Color Scheme <F8>
"nnoremap <silent> <C-v> :execute RotateColorTheme()<CR>

" DOS is for fools.
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Paste Mode!  Dang! <F10>
nnoremap <Leader>p :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Edit zshrc \gv
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.zshrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Good call Benjie (r for i)
nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Make
nnoremap cn <Esc>:cn<CR>
nnoremap cp <Esc>:cp<CR>

" Testing
set completeopt=longest,menuone,preview

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Fix email paragraphs
nnoremap <leader>par :%s/^>$//<CR>

" Remaps for greek
nmap ι i
nmap Ι I
nmap α a
nmap Α A
nmap ο o
nmap Ο O
nmap Ψ C
nmap δδ dd
nmap Δ D
nmap π p
nmap θ u
nmap ΄ :

"}}}

"{{{Taglist configuration
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}

"{{{File templates, indentation and syntax

if has ("autocmd")

"{{{C and C++

"autocmd BufNewFile *.c,*.cpp,*.h so /Users/indoril/.vim/c_template
"autocmd BufNewFile *.c,*.cpp,*.h exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.c,*.cpp,*.h exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.c,*.cpp,*.h execute "normal ma"
"autocmd Bufwritepre,filewritepre *.c,*.cpp,*.h exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost *.c,*.cpp,*.h execute "normal `a"
autocmd BufNewFile,BufRead *.c,*.h set smartindent cinwords cinwords=if,else,for,do,while,switch
autocmd BufNewFile,BufRead *.cpp set smartindent cinwords cinwords=if,else,for,do,while,switch,class
"}}}

"{{{SML
"autocmd BufNewFile *.sml,*.ml so /Users/indoril/.vim/ml_template
"autocmd BufNewFile *.sml,*.ml exe "1," . 6. "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.sml,*.ml exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.sml,*.ml execute "normal ma"
"autocmd Bufwritepre,filewritepre *.sml,*.ml exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost  *.sml,*.ml execute "normal `a"
autocmd BufNewFile,BufRead *sml,*.ml set smartindent cinwords cinwords=fun,if,then,else,let,in,sig,struct,adstype,datatype,functor,structure,signature,case syntax=sml
"}}}

"{{{Haskell
"autocmd BufNewFile *.hs so /Users/indoril/.vim/haskell_template
"autocmd BufNewFile *.hs exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.hs exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.hs execute "normal ma"
"autocmd Bufwritepre,filewritepre *.hs exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost  *.hs execute "normal `a"
autocmd BufNewFile,BufRead *.hs set smartindent cinwords cinwords=fun,if,then,else,let,in,sig,struct,adstype,datatype,functor,structure,signature,case
"}}}

"{{{Prolog
"autocmd BufNewFile *.yap,*.prolog,*.pl so /Users/indoril/.vim/prolog_template
"autocmd BufNewFile *.yap,*.prolog,*.pl exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.yap,*.prolog,*.pl exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.yap execute "normal ma"
"autocmd Bufwritepre,filewritepre *.yap exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost *.yap execute "normal `a"
autocmd BufNewFile,Bufread *.yap,*.prolog,*.pl set smartindent syntax=prolog
"}}}

"{{{Java
"autocmd BufNewFile *.java so /Users/indoril/.vim/java_template
"autocmd BufNewFile *.java set smartindent
"autocmd BufNewFile *.java exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.java exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.java execute "normal ma"
"autocmd Bufwritepre,filewritepre *.java exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost *.java execute "normal `a"
autocmd BufNewFile,BufRead *.java set tags=~/.tags smartindent cinwords cinwords=if,else,for,do,while,switch,class,try,finally
"}}}

"{{{Python
"autocmd BufNewFile *.py so /Users/indoril/.vim/python_template
"autocmd BufNewFile *.py set smartindent
"autocmd BufNewFile *.py exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.py exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.py execute "normal ma"
"autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %d %b %Y %H:%M:%S")
"autocmd bufwritepost,filewritepost *.py execute "normal `a"
autocmd BufNewFile,BufRead *.py set smartindent cinwords cinwords=if,elif,else,for,while,try,except,finally,def,class
"}}}

"{{{TeX
autocmd BufNewFile,BufRead *.tex set tw=78 noet
"autocmd BufNewFile,BufRead *.tex silent !term %:p:h latexmk -xelatex -shell-escape -synctex=1 -pvc
autocmd BufNewFile,BufRead Makefile,makefile set ts=4 sw=4 noet nosi noai
"}}}

"{{{Pazcal
"autocmd BufNewFile *.pzc,*pzh so /Users/indoril/.vim/pazcal_template
"autocmd BufNewFile *.pzc,*pzh exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd BufNewFile *.pzc,*pzh exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.py execute "normal ma"
"autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%+")
"autocmd bufwritepost,filewritepost *.py execute "normal `a"
"}}}

"{{{PHP
autocmd BufRead,BufNewFile *.php setfiletype=php
:iab phpcontroller <?php<CR><Tab>class Controller {<CR>public static function View() {<CR>}<CR>public static function Listing() {<CR>}<CR>public static function Create() {<CR>}<CR>public static function Update() {<CR>}<CR>public static function Delete() {<CR>}<CR><BS>}<CR><BS>?><Esc>gg<Down>WWi
"}}}

endif " has("autocmd")
"}}}

let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

set nohls
filetype plugin indent on
syntax on
