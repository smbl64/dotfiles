" Search regex -> a group of alphanumeric characters + dash + dot, ending with
" a colon and 'space or newline'.

" Search for 'some-word:' backward. 'W' option stands for 'nowrapscan',
" meaning that we don't want to go to the other side of the file.
map <silent> <buffer> [[ :silent! eval search('^[0-9a-zA-Z\.\-]\+:[ \n]', 'bW')<CR>

" Search for 'some-word:' forward
map <silent> <buffer> ]] :silent! eval search('^[0-9a-zA-Z\.\-]\+:[ \n]', 'W')<CR>
