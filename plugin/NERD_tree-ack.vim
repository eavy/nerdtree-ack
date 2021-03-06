" ============================================================================
" File:        NERD_tree-ack.vim
" Description: Adds searching capabilities to NERD_Tree
" Maintainer:  Mohammad Satrio <wolfaeon at gmail dot com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================


" don't load multiple times
if exists("g:loaded_nerdtree_ack")
    finish
endif

let g:loaded_nerdtree_ack = 1

" add the new menu item via NERD_Tree's API
call NERDTreeAddMenuItem({
    \ 'text': 's(e)arch files with ack',
    \ 'shortcut': 'e',
    \ 'callback': 'NERDTreeAck' })

call NERDTreeAddMenuItem({
    \ 'text': '(s)earch files, case sensitive',
    \ 'shortcut': 's',
    \ 'callback': 'NERDTreeAckSensitive' })

call NERDTreeAddMenuItem({
    \ 'text': '(q)search c/cpp files, case sensitive',
    \ 'shortcut': 'q',
    \ 'callback': 'NERDTreeAckCCPP' })

function! NERDTreeAck()
    " get the current dir from NERDTree
    let cd = g:NERDTreeDirNode.GetSelected().path.str()

    " get the pattern
    let pattern = input("Enter the pattern: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec "Ack! ".pattern." '".cd."'"
endfunction

function! NERDTreeAckSensitive()
    " get the current dir from NERDTree
    let cd = g:NERDTreeDirNode.GetSelected().path.str()

    " get the pattern
    let pattern = input("Enter the pattern: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec "Ack! '".pattern."' ".cd
endfunction

function! NERDTreeAckCCPP()
    " get the current dir from NERDTree
    let cd = g:NERDTreeDirNode.GetSelected().path.str()

    " get the pattern
    let pattern = input("Enter the pattern: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec "Ack! --cc --cpp '".pattern."' ".cd
endfunction
