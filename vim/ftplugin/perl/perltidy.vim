let g:perl_tidy_path = "perltidy"

function s:RunPerlTidy() range
    let cmd = g:perl_tidy_path
    if !executable(cmd)
        echohl ErrorMsg
        echom "perltidy not found!"
        echohl None
        return
    endif

    silent execute a:firstline . "," . a:lastline . "!" . cmd
    echo "Done formatting."
endfunction
"
" Create a command to call the black-macchiato function
command -range PerlTidy <line1>,<line2>call <sid>RunPerlTidy()

xnoremap <plug>(PerlTidySelection) :PerlTidy<cr>
nnoremap <plug>(PerlTidyCurrentLine) :PerlTidy<cr>
