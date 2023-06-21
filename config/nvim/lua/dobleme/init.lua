require('dobleme.set')
require('dobleme.remap')
require('dobleme.packer')

require('fluoromachine').setup({
    theme = 'delta',
    transparent = true,
    --overrides = function(c)
    --    return {
    --        TelescopeResultsBorder = { fg = c.alt_bg, bg = c.alt_bg },
    --        TelescopeResultsNormal = { bg = c.alt_bg },
    --        TelescopePreviewNormal = { bg = c.bg },
    --        TelescopePromptBorder = { fg = c.alt_bg, bg = c.alt_bg },
    --        TelescopeTitle = { fg = c.fg, bg = c.comment },
    --        TelescopePromptPrefix = { fg = c.purple },
    --    }
    --end
})
vim.cmd.colorscheme('fluoromachine')
