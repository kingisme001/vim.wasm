if (exists("b:did_ftplugin"))
finish
endif
let b:did_ftplugin = 1
setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:#,:; commentstring=;\ %s
let b:undo_ftplugin = "setl fo< com< cms<"
