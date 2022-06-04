local cmd = vim.cmd

print("links!")

cmd("hi test guifg=red guibg=green")
cmd("syntax match test /test/")
