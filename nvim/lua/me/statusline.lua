vim.cmd([[
    set statusline=
    set statusline+=%#CursorIM#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#Search#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
    set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    set statusline+=%#Visual#                " colour
    set statusline+=%{&paste?'\ PASTE\ ':''}
    set statusline+=%{&spell?'\ SPELL\ ':''}
    set statusline+=%#CursorIM#              " colour
    set statusline+=%R                       " readonly flag
    set statusline+=%M                       " modified [+] flag
    set statusline+=%#CursorLine#            " colour
    set statusline+=\ %f\                    " short file name
    set statusline+=%=                       " right align
    set statusline+=%#CursorLine#            " colour
    set statusline+=\ %y\                    " file type
    set statusline+=%#CursorIM#              " colour
    set statusline+=%#CursorIM#              " colour
    set statusline+=\ %3l:%-2c\              " line + column
    set statusline+=%#CursorIM#              " colour
    set statusline+=\ %3p%%\                 " percentage
]])
