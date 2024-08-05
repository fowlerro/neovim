return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				separator_style = "slant",
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Go to next buffer" })
		keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Go to previous buffer" })
	end,
}
