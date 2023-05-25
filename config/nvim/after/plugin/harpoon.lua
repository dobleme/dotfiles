local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hn", ui.nav_next)
vim.keymap.set("n", "<leader>hp", ui.nav_prev)
