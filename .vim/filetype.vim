if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd BufRead,BufNewFile *.pzc setfiletype pzc
augroup END
