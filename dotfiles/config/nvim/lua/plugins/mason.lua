return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"eslint",
				"gopls",
				"html",
				"jsonls",
				"pyright",
				"ts_ls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d", -- js formatter
				"prettier", -- js formatter
				"ruff", -- python formatter
				"stylua", -- lua formatter
			},
		})
	end,
}
