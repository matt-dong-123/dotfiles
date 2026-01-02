return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            markdown = { 'prettier' },
            cpp = { 'clang-format' },
            c = { 'clang-format' },
            python = { 'isort', 'ruff' },
            rust = { 'rustfmt' },
            zsh = { 'shfmt' },
            sh = { 'shfmt' },
            java = { 'google-java-format' },
            json = { 'prettier' },
            jsonc = { 'prettier' },
            yaml = { 'prettier' },
            toml = { 'taplo' },
            typst = { 'typstyle' },
        },
        formatters = {
            ['google-java-format'] = {
                prepend_args = { '--aosp' },
            },
        },
        format_on_save = {},
    },
}
