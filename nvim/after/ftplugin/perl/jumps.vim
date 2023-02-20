" Search for 'sub some_word' backward. 'W' option stands for 'nowrapscan',
" meaning that we don't want to go to the other side of the file.
map <silent> <buffer> [[ :silent! eval search('^sub \w\+', 'bW')<CR>

" Search for 'sub some_word' forward
map <silent> <buffer> ]] :silent! eval search('^sub \w\+', 'W')<CR>
