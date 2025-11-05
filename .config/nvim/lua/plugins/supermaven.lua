return {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    cmd = { 'SupermavenUseFree', 'SupermavenUsePro' },
    build = ':SupermavenUseFree',
    opts = {},
}
