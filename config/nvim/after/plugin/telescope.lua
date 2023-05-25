local ts = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function()
    ts.find_files({ follow = true })
end)
vim.keymap.set('n', '<leader>fg', ts.git_files, {})
vim.keymap.set('n', '<leader>gf', function()
	ts.grep_string({ search = vim.fn.input("Grep > ") });
end)
