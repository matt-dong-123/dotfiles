return {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    opts = {
        linters_by_ft = {
            sh = { 'shellcheck' },
            cpp = { 'cpplint' },
            go = { 'staticcheck' },
            lua = { 'selene' },
            markdown = { 'markdownlint' },
        },
        linters = {
            selene = {
                condition = function(ctx)
                    return vim.fs.find(
                        { 'selene.toml' },
                        { path = ctx.filename, upward = true }
                    )[1]
                end,
            },
        },
    },
    config = function()
        vim.api.nvim_create_autocmd(
            { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
            {
                callback = function()
                    -- Only run the linter in buffers that you can modify in order to
                    -- avoid superfluous noise, notably within the handy LSP pop-ups that
                    -- describe the hovered symbol using Markdown.
                    if vim.opt_local.modifiable:get() then
                        require('lint').try_lint()
                    end
                end,
            }
        )
    end,
}
