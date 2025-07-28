return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            markdown = { 'markdownlint' },
            cpp = { 'cpplint' },
            c = { 'cpplint' },
            python = { 'black', 'isort' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
