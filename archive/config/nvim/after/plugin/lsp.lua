local lsp = require('lsp-zero')
local cmp = require('cmp')
local nls = require('null-ls')

lsp.preset({})

lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    ["<C-a>"] = cmp.mapping.complete(),
})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>vo", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set({ "n", "x" }, "<leader>vf", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-a>", function() vim.lsp.buf.code_action() end, opts)
end)
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})
lsp.configure('cmake', {
    filetypes = { 'cmake', 'make' }
})

nls.setup({
    sources = {
        nls.builtins.formatting.black.with({
            args = { "-t", "py310", "-l", "79", "--stdin-filename", "$FILENAME", "--quiet", "-" }
        }),
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.goimports,
        nls.builtins.diagnostics.checkmake,
    }
})

lsp.setup()
