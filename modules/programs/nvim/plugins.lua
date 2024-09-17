require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true }
})

require("gitsigns").setup({
    signcolumn = true,
    numhl = true,
    current_line_blame = true
})

require("which-key").setup({
    marks = false,
    registers = true,
    spelling = { enabled = false },
    presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
    },
    win = { border = "single" },
    icons = { mappings = false },
})
require("which-key").add({
    { "<leader>pv", desc = "Open netrw" },
    { "<leader>y", desc = "Copy to xclip" },
    { "<leader>f", group = "telescope" },
    { "<leader>fb", desc = "Find current buffers" },
    { "<leader>fc", desc = "Find incoming calls" },
    { "<leader>fd", desc = "Find/go symbol definitions" },
    { "<leader>fe", desc = "Find diagnostics" },
    { "<leader>ff", desc = "Find files" },
    { "<leader>fg", desc = "Live grep in workspace" },
    { "<leader>fi", desc = "Find/go symbol implementations" },
    { "<leader>fo", desc = "Find outgoing calls" },
    { "<leader>fq", desc = "Find quickfix list" },
    { "<leader>fr", desc = "Find symbol references" },
    { "<leader>fs", desc = "Find document symbols" },
    { "<leader>fS", desc = "Find workspace symbols" },
    { "<leader>v", group = "lsp/diagnostics" },
    { "<leader>vd", desc = "Open diagnostic float" },
    { "<leader>vj", desc = "Goto next diagnostic" },
    --{ "<leader>vc", desc = "Code action" },
    --{ "<leader>vf", desc = "Format document" },
    --{ "<leader>vh", desc = "Signature help symbol" },
    --{ "<leader>vo", desc = "Hover symbol" },
    --{ "<leader>vr", desc = "Rename symbol" },
})

local ts = require("telescope.builtin")
local th = require("telescope.themes")
local ivyTh = th.get_ivy({ layout_config = { height = 20 } })
local dropdownTh = th.get_dropdown()
vim.keymap.set("n", "<leader>fb", function() ts.buffers(dropdownTh) end)
vim.keymap.set("n", "<leader>fc", function() ts.lsp_incoming_calls(ivyTh) end)
vim.keymap.set("n", "<leader>fd", function() ts.lsp_definitions(ivyTh) end)
vim.keymap.set("n", "<leader>fe", function() ts.diagnostics(theme) end)
vim.keymap.set("n", "<leader>ff", function() ts.find_files({ follow = true }) end)
vim.keymap.set("n", "<leader>fg", function() ts.live_grep(dropdownTh) end)
vim.keymap.set("n", "<leader>fi", function() ts.lsp_implementations(ivyTh) end)
vim.keymap.set("n", "<leader>fo", function() ts.lsp_outgoing_calls(ivyTh) end)
vim.keymap.set("n", "<leader>fq", function() ts.quickfix(dropdownTh) end)
vim.keymap.set("n", "<leader>fr", function() ts.lsp_references(ivyTh) end)
vim.keymap.set("n", "<leader>fs", function() ts.lsp_document_symbols(dropdownTh) end)
vim.keymap.set("n", "<leader>fS", function() ts.lsp_workspace_symbols(dropdownTh) end)

require("lualine").setup({
    options = {
        theme = {
            normal = {
                a = { fg = vim.g.palette_base00, bg = vim.g.palette_base07 },
                b = { fg = vim.g.palette_base06, bg = vim.g.palette_base02 },
                c = { fg = vim.g.palette_base05, bg = vim.g.palette_base00 },
            },
            insert = { a = { fg = vim.g.palette_base00, bg = vim.g.palette_base0E } },
            visual = { a = { fg = vim.g.palette_base00, bg = vim.g.palette_base0D } },
            replace = { a = { fg = vim.g.palette_base00, bg = vim.g.palette_base09 } },
            command = { a = { fg = vim.g.palette_base00, bg = vim.g.palette_base08 } },
            inactive = {
                a = { fg = vim.g.palette_base05, bg = vim.g.palette_base02 },
                b = { fg = vim.g.palette_base05, bg = vim.g.palette_base02 },
                c = { fg = vim.g.palette_base05, bg = vim.g.palette_base00 },
            },
        },
        icons_enabled = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", { "branch", icon = "" } },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = {},
        lualine_y = { "filetype",  "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } }
    },
})
