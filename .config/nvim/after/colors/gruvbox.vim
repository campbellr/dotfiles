" Customizations to make the gruvbox diff mode more readable

" Change highlight groups for diff mode
hi! clear DiffChange
hi! clear DiffText
hi! clear DiffAdd
hi! clear DiffDelete
" Do not highlight changed line, highlight only changed text within a line
hi! link DiffChange NONE
hi! DiffText ctermbg=208 guibg=#fe8019 ctermfg=233 guifg=#141617
hi! DiffAdd ctermfg=108 guifg=#8ec07c
hi! DiffDelete ctermfg=167 guifg=#fb4934 guibg=#141617 ctermbg=233
