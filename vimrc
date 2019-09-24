execute pathogen#infect()

let s:activatedcol = 0
function! ToggleColumnLine()
    hi OverLength ctermbg=magenta ctermfg=black guibg=#592929
    hi ColorColumn ctermbg=magenta ctermfg=black
    if s:activatedcol == 0
        let s:activatedcol = 1
        set cc=80
    else
        if s:activatedcol == 1
            let s:activatedcol = 2
            set cc=80
            match OverLength /\%81v.\+/
        else
            let s:activatedcol = 0
            set cc=
            match none
        endif
    endif
endfunction

set tabstop=4 shiftwidth=4 expandtab
set hlsearch incsearch relativenumber number
set path+=**
colorscheme elflord
map <F2> :NERDTreeToggle<CR>
map <F3> :call ToggleColumnLine()<CR>
map <F4> :set <c-r>=&number ? &relativenumber ? "norelativenumber number" : "norelativenumber nonumber" : "number relativenumber"<cr><cr>
map <F5> :GoFmt<CR>
map <F8> :GoBuild<CR>
map <F12> :GoTest<CR>
let NERDTreeQuitOnOpen=1
let g:go_version_warning = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
