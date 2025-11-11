return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            markdown = { 'prettier' },
            cpp = { 'cpplint' },
            c = { 'cpplint' },
            python = { 'isort', 'ruff' },
            rust = { 'rustfmt' },
            zsh = { 'shfmt' },
            sh = { 'shfmt' },
            json = { 'prettier' },
            jsonc = { 'prettier' },
            yaml = { 'prettier' },
            toml = { 'taplo' },
        },
        format_on_save = {},
        formatters = {
            shfmt = {
                inherit = false,
                command = 'shfmt',
                args = { '-filename', '$FILENAME', '-i', '4' },
            },
        },
    },
}
