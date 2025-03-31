return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    opts = {},
    vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', {}),
}
