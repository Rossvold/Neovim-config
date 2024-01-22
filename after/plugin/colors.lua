    require('rose-pine').setup({
        disable_background = false,
})
function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)


end

ColorMyPencils()

