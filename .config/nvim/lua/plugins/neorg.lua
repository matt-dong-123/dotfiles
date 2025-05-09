return {
    'nvim-neorg/neorg',
    event = 'VeryLazy',
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
    opts = {
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {},
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        notes = '~/Notes',
                    },
                    default_workspace = 'notes',
                },
            },
        },
    },
}
