if exists("b:did_ftplugin")
finish
endif
let b:did_ftplugin = 1
let b:undo_ftplugin = "setl com< cms< fo<"
setlocal comments=:!,:# commentstring=#\ %s
setlocal formatoptions-=t formatoptions+=croql
