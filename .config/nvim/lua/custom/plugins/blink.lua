return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        keymap = { preset = 'default' },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },
        signature = { enabled = true },
    },
    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'orgmode' },
            -- Or if you want to use only this provider in org files
            -- enabled_providers = function()
            --   if vim.bo.filetype == 'org' then
            --     return { 'orgmode' }
            --   end
            --   return { 'lsp', 'path', 'snippets', 'buffer' }
            -- end
        },
        providers = {
            orgmode = {
                name = 'Orgmode',
                module = 'orgmode.org.autocompletion.blink',
            },
        },
    },
}
