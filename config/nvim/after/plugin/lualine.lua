local lualine = require('lualine')

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'fluoromachine',
        component_separators = { left = '❫', right = '❪' },
        section_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'branch', icon = '' },
            'diff',
            'diagnostics'
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
})
