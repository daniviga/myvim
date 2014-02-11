execute pathogen#infect()

let g:syntastic_python_checkers=['flake8']

syntax on
if has('gui_running')
    set background=light
else
    set background=dark
endif

set number
highlight LineNr ctermfg=lightblue
highlight ColorColumn ctermbg=red
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set cursorline
set nohidden

" If the open file is a .py file, show a visual error if line length >= 80 chars.
autocmd BufRead,BufNewFile *.py :match ErrorMsg '\%>79v.\+'
autocmd FileType python set textwidth=79
autocmd FileType python set colorcolumn=80
autocmd BufRead,BufNewFile *.js :match ErrorMsg '\%>79v.\+'
autocmd FileType gitcommit :match ErrorMsg '\%>72v.\+'
autocmd FileType gitcommit set textwidth=72

" Trim trailing whitespace:
function TrimWhiteSpace()
    " Don't strip whitespace on these filetypes
    if &ft =~ 'diff'
        return
    endif
    %s/\s*$//
    ''
:endfunction

set list listchars=tab:»·,trail:·
autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()
