syntax enable       " enable syntax highlighting

set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set showmatch       " highlight matching [{()}]
set ignorecase      " ignore case when searching
set incsearch       " search as characters are entered
set smartcase       " when searching try to be smart about cases 
set hlsearch        " highlight matches
set autoread        " update when a file is changed from the outside
set ruler           " always show current position
set hid             " a buffer becomes hidden when it is abandoned
set magic           " for regular expressions turn magic on
set ai              " Auto indent
set si              " Smart indent


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()



" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set laststatus=2    " always show the status line
set encoding=utf8   " set utf8 as standard encoding and en_US as the standard language
set foldcolumn=1    " add a bit extra margin to the left
set tabstop=4       " number of visual spaces per TAB
set cmdheight=2     " height of the command bar
set history=500     " sets how many lines of history VIM has to remember
set so=7            " set 7 lines to the cursor - when moving vertically using j/k