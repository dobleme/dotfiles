local wk = require('which-key')
wk.register({
    ['<leader>f'] = {
        name = '+find',
        f = 'Find files',
        b = 'Find current buffers',
        g = 'Live grep in workspace',
        s = 'Find document symbols',
        S = 'Find workspace symbols',
        c = 'Find incoming calls',
        o = 'Find outgoing calls',
        r = 'Find symbol references',
        i = 'Find/go symbol implementations',
        d = 'Find/go symbol definitions',
    },
    ['<leader>v'] = {
        name = '+lsp',
        o = 'Hover symbol',
        r = 'Rename symbol',
        h = 'Signature help symbol',
        c = 'Code action',
        f = 'Format document',
    }
})
