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
