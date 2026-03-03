-- Mappings.
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>n", "<cmd>Neotree focus<cr>", opts)

vim.keymap.set({ "n", "i", "v" }, "<up>", "<nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<down>", "<nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<left>", "<nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<right>", "<nop>", opts)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts2 = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts2)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts2)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts2)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts2)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts2)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts2)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts2)
		vim.keymap.set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts2)
		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts2)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts2)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts2)
	end,
})
