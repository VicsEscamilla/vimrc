unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

execute pathogen#infect()

let s:activatedcol = 0
function! ToggleColumnLine()
    if s:activatedcol == 0
        let s:activatedcol = 1
        set cc=80
    else
        if s:activatedcol == 1
            let s:activatedcol = 2
            match OverLength /\%81v.\+/
        else
            let s:activatedcol = 0
            set cc=
            match none
        endif
    endif
endfunction

set tabstop=4 shiftwidth=4 expandtab
set incsearch relativenumber number
set path+=**
map <F2> :NERDTreeToggle<CR>
map <F4> :set <c-r>=&number ? &relativenumber ? "norelativenumber number" : "norelativenumber nonumber" : "number relativenumber"<cr><cr>
map <F10> :GoFmt<CR>
map <F11> :GoBuild<CR>
map <F12> :GoTest<CR>
let NERDTreeQuitOnOpen=1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

" 80 characters line config...
hi ColorColumn ctermbg=magenta ctermfg=black
hi OverLength ctermbg=magenta ctermfg=black guibg=#592929
""" map <F3> :call ToggleColumnLine()<CR>
map <F3> :let &cc = &cc == '' ? '80' : ''<CR>
set nopaste
set pastetoggle=<F5>

" ctags stuff
set tags=./tags;$HOME
set hlsearch

" disable mouse
set mouse=i

" colors
set t_Co=256
set bg=dark
colorscheme gruvbox

" control-P
set wildignore+=*/tmp/*,*.so,*.swp,*.class

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
