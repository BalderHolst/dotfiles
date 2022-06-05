local cmd = vim.api.nvim_command

return(function ()
	cmd("hi obslink guifg=#ed6b25")
	cmd("syntax match obslink /\\[\\[.\\{-}\\]\\]/")
end)


