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
    { "<leader>pv", desc = "open netrw" },
    { "<leader>y", desc = "copy to xclip" },
    { "<leader>v", group = "lsp/diagnostics" },
    { "<leader>vd", desc = "open diagnostic float" },
    { "<leader>vj", desc = "goto next diagnostic" },
    --{ "<leader>vc", desc = "Code action" },
    --{ "<leader>vf", desc = "Format document" },
    --{ "<leader>vh", desc = "Signature help symbol" },
    --{ "<leader>vo", desc = "Hover symbol" },
    --{ "<leader>vr", desc = "Rename symbol" },
})

require("telescope").setup({
    pickers = {
        -- File pickers
        find_files = { follow = true },
        live_grep = { theme = "ivy" },
        -- Vim pickers
        buffers = { theme = "ivy" },
        quickfix = { theme = "ivy" },
        -- LSP pickers
        lsp_references = { theme = "ivy" },
        lsp_incoming_calls = { theme = "ivy" },
        lsp_outgoing_calls = { theme = "ivy" },
        lsp_document_symbols = { theme = "ivy" },
        lsp_workspace_symbols = { theme = "ivy" },
        diagnostics = { theme = "ivy" },
        lsp_implementations = { theme = "ivy" },
        lsp_definitions = { theme = "ivy" },
    },
})
local ts = require("telescope.builtin")
require("which-key").add({
    { "<leader>f", group = "telescope" },
    { "<leader>ff", ts.find_files, desc = "find files" },
    { "<leader>fg", ts.live_grep, desc = "live grep in workspace" },
    { "<leader>fb", ts.buffers, desc = "find current buffers" },
    { "<leader>fh", ts.help_tags, desc = "find help tags" },
    { "<leader>fq", ts.quickfix, desc = "find quickfix list" },
    { "<leader>fr", ts.lsp_references, desc = "find symbol references" },
    { "<leader>fc", ts.lsp_incoming_calls, desc = "find incoming calls" },
    { "<leader>fo", ts.lsp_outgoing_calls, desc = "find outgoing calls" },
    { "<leader>fs", ts.lsp_document_symbols, desc = "find document symbols" },
    { "<leader>fS", ts.lsp_workspace_symbols, desc = "find workspace symbols" },
    { "<leader>fe", ts.diagnostics, desc = "find diagnostics" },
    { "<leader>fi", ts.lsp_implementations, desc = "find/go symbol implementations" },
    { "<leader>fd", ts.lsp_definitions, desc = "find/go symbol definitions" },
})

local f = require("flash")
f.setup({ modes = { search = { enabled = true} } })
require("which-key").add({
    { "<leader>j", f.jump, desc = "flash jump" },
    { "<leader>s", f.treesitter , desc = "flash treesitter" },
})

local function macro_recording()
	local mode = require("noice").api.statusline.mode.get()
	if mode then
		return string.match(mode, "^recording @.*") or ""
	end
	return ""
end
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
        lualine_x = { macro_recording },
        lualine_y = { "filetype",  "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } }
    },
})

require("noice").setup({
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    }
})
