return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            markdown = { 'markdownlint' },
            cpp = { 'cpplint' },
            c = { 'cpplint' },
            python = { 'black', 'isort', 'ruff' },
            rust = { 'rustfmt' },
            zsh = { 'shfmt' },
            sh = { 'shfmt' },
        },
        format_on_save = {},
    },
}
