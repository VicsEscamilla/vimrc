execute pathogen#infect()
set tabstop=4 shiftwidth=4 expandtab
set hlsearch incsearch relativenumber number
set path+=**
colorscheme elflord
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :set <c-r>=&number ? &relativenumber ? "norelativenumber number" : "norelativenumber nonumber" : "number relativenumber"<cr><cr>
map <F5> :GoFmt<CR>
map <F8> :GoBuild<CR>
map <F12> :GoTest<CR>
let NERDTreeQuitOnOpen=1
let g:go_version_warning = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
