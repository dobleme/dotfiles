require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    indent = { enable = true }
})

require('gitsigns').setup({
    signcolumn = true,
    numhl = true,
    current_line_blame = true
})

require('which-key').add({
    { "<leader>f", group = "telescope" },
    { "<leader>fS", desc = "Find workspace symbols" },
    { "<leader>fb", desc = "Find current buffers" },
    { "<leader>fc", desc = "Find incoming calls" },
    { "<leader>fd", desc = "Find/go symbol definitions" },
    { "<leader>ff", desc = "Find files" },
    { "<leader>fg", desc = "Live grep in workspace" },
    { "<leader>fi", desc = "Find/go symbol implementations" },
    { "<leader>fo", desc = "Find outgoing calls" },
    { "<leader>fr", desc = "Find symbol references" },
    { "<leader>fs", desc = "Find document symbols" },
    { "<leader>v", group = "lsp" },
    { "<leader>vc", desc = "Code action" },
    { "<leader>vf", desc = "Format document" },
    { "<leader>vh", desc = "Signature help symbol" },
    { "<leader>vo", desc = "Hover symbol" },
    { "<leader>vr", desc = "Rename symbol" },
})

local ts = require('telescope.builtin')
local th = require('telescope.themes')
vim.keymap.set('n', '<leader>ff', function()
    ts.find_files({ follow = true })
end)
vim.keymap.set('n', '<leader>fb', function()
    ts.buffers(th.get_dropdown())
end)
vim.keymap.set('n', '<leader>fg', function()
    ts.live_grep(th.get_dropdown())
end)
vim.keymap.set('n', '<leader>fs', function()
    ts.lsp_document_symbols(th.get_dropdown())
end)
vim.keymap.set('n', '<leader>fS', function()
    ts.lsp_workspace_symbols(th.get_dropdown())
end)
vim.keymap.set('n', '<leader>fc', function()
    ts.lsp_incoming_calls(th.get_ivy({ layout_config = { height = 20 } }))
end)
vim.keymap.set('n', '<leader>fo', function()
    ts.lsp_outgoing_calls(th.get_ivy({ layout_config = { height = 20 } }))
end)
vim.keymap.set('n', '<leader>fr', function()
    ts.lsp_references(th.get_ivy({ layout_config = { height = 20 } }))
end)
vim.keymap.set('n', '<leader>fi', function()
    ts.lsp_implementations(th.get_ivy({ layout_config = { height = 20 } }))
end)
vim.keymap.set('n', '<leader>fd', function()
    ts.lsp_definitions(th.get_ivy({ layout_config = { height = 20 } }))
end)
vim.keymap.set('n', '<leader>fq', function()
    ts.quickfix(th.get_dropdown())
end)
vim.keymap.set('n', '<leader>fe', function()
    ts.diagnostics(th.get_ivy({ layout_config = { height = 30 } }))
end)

