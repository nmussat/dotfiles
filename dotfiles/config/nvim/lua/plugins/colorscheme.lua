return {
	"ayu-theme/ayu-vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark"
		vim.g.ayucolor = "dark"
		vim.cmd("colorscheme ayu")
	end,
}

-- return {
-- 	"tiagovla/tokyodark.nvim",
-- 	opts = {
-- 		-- custom options here
-- 	},
-- 	config = function(_, opts)
-- 		require("tokyodark").setup(opts) -- calling setup is optional
-- 		vim.cmd([[colorscheme tokyodark]])
-- 	end,
-- }
