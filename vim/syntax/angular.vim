" Vim syntax file
" Language: Angular Template
" Maintainer: George Hickman <george@ghickman.co.uk>
" Last Change: 2014 March 3

" Extend html syntax
runtime! syntax/html.vim

syntax case match

" Mark illegal characters
syn match angularError "{%\|%}\|}}\|#}"

" Angular template built-in parameters
syn keyword angularStatement contained as in

" Angular variable blocks
syn region angularVarBlock start="{{" end="}}" display

" Keywords to highlight within comments
syn keyword angularTodo contained TODO FIXME XXX

let b:current_syntax = "angular"
