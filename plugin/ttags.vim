" ttags.vim -- Tag list browser (List, filter, preview, jump to tags)
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-09-09.
" @Last Change: 2019-04-11.
" @Revision:    172
" GetLatestVimScripts: 2018 1 ttags.vim
"
" TODO: Open in new window (split, vsplit, tab)
" TODO: Fix preview

if &cp || exists('loaded_ttags')
    finish
endif
let loaded_ttags = 6

let s:save_cpo = &cpo
set cpo&vim


" :display: Ttags[!] [KIND] [TAGS_RX] [FILE_RX]
" See also |ttags#List()| and |ttags#SelectTags()|.
"
" Examples:
" Match tags in the current file: >
"   Ttags * * .
" Show classes [c]: >
"   Ttags c
" Show classes beginning with Foo: >
"   Ttags c ^Foo
command! -nargs=* -bang Ttags call ttags#List(!empty('<bang>'), <f-args>)


" :display: Ttagshere[!] [KIND] [TAGS_RX]
command! -nargs=* -bang Ttagshere call ttags#SelectBufferTags(!empty('<bang>'), <f-args>)


" :display: Ttagselect[!] kind:KIND FIELD:REGEXP ...
" For values of field see |taglist()|. These fields depend also on your 
" tags generator.
"
" If you want to automatically restict your searches to the current 
" namespace, you would have to write a function that determines the 
" namespace (and maybe e-mail it to me) and then call 
" |ttags#SelectTags()|.
"
" Examples:
"   " Show tags matching "bar" in class "Foo"
"   Ttagselect name:bar class:Foo
command! -nargs=* -bang Ttagselect call ttags#Select(!empty('<bang>'), <q-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
