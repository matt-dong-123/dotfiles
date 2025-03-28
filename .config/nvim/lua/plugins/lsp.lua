return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Mason
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },

        -- Completion
        'Saghen/blink.cmp',
    },
    config = function()
        -- Run when an LSP attaches to a particular buffer.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup(
                'kickstart-lsp-attach',
                { clear = true }
            ),
            callback = function(event)
                -- Mapping function
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(
                        mode,
                        keys,
                        func,
                        { buffer = event.buf, desc = 'LSP: ' .. desc }
                    )
                end

                -- Jump to the definition of the word under your cursor. (Press C-t to go back)
                map(
                    'gd',
                    require('fzf-lua').lsp_definitions,
                    '[G]oto [D]efinition'
                )

                -- Find references for the word under your cursor.
                map(
                    'gr',
                    require('fzf-lua').lsp_references,
                    '[G]oto [R]eferences'
                )

                -- Jump to the implementation of the word under your cursor.
                map(
                    'gI',
                    require('fzf-lua').lsp_implementations,
                    '[G]oto [I]mplementation'
                )

                -- Jump to the *type* of the word under your cursor.
                map(
                    '<leader>D',
                    require('fzf-lua').lsp_typedefs,
                    'Type [D]efinition'
                )

                -- Fuzzy find all the symbols (variables, functions, types, etc.) in your current document.
                map(
                    '<leader>ds',
                    require('fzf-lua').lsp_document_symbols,
                    '[D]ocument [S]ymbols'
                )

                -- Fuzzy find all the symbols in your current project.
                map(
                    '<leader>ws',
                    require('fzf-lua').lsp_live_workspace_symbols,
                    '[W]orkspace [S]ymbols'
                )

                -- Rename the variable under your cursor.
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map(
                    '<leader>ca',
                    vim.lsp.buf.code_action,
                    '[C]ode [A]ction',
                    { 'n', 'x' }
                )

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- Highlight references of the word under your cursor when your cursor rests there for a little while.
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client.supports_method(
                        vim.lsp.protocol.Methods.textDocument_documentHighlight
                    )
                then
                    local highlight_augroup = vim.api.nvim_create_augroup(
                        'kickstart-lsp-highlight',
                        { clear = false }
                    )
                    vim.api.nvim_create_autocmd(
                        { 'CursorHold', 'CursorHoldI' },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { 'CursorMoved', 'CursorMovedI' },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup(
                            'kickstart-lsp-detach',
                            { clear = true }
                        ),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds {
                                group = 'kickstart-lsp-highlight',
                                buffer = event2.buf,
                            }
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your code
                -- WARN: This may be unwanted, since they displace some of your code
                if
                    client
                    and client.supports_method(
                        vim.lsp.protocol.Methods.textDocument_inlayHint
                    )
                then
                    map('<leader>th', function()
                        vim.lsp.inlay_hint.enable(
                            not vim.lsp.inlay_hint.is_enabled {
                                bufnr = event.buf,
                            }
                        )
                    end, '[T]oggle Inlay [H]ints')
                end
            end,
        })

        -- Change diagnostic symbols in the sign column (gutter)
        if vim.g.have_nerd_font then
            local signs =
                { ERROR = '', WARN = '', INFO = '', HINT = '' }
            local diagnostic_signs = {}
            for type, icon in pairs(signs) do
                diagnostic_signs[vim.diagnostic.severity[type]] = icon
            end
            vim.diagnostic.config { signs = { text = diagnostic_signs } }
        end

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local original_capabilities =
            vim.lsp.protocol.make_client_capabilities()
        local capabilities =
            require('blink.cmp').get_lsp_capabilities(original_capabilities)

        -- Enable the following language servers
        --  cmd (table): Override the default command used to start the server
        --  filetypes (table): Override the default list of associated filetypes for the server
        --  capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  settings (table): Override the default settings passed when initializing the server.
        --  For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
            clangd = {},
            gopls = {},
            pyright = {},
            lua_ls = {},
            -- rust_analyzer = {},
            -- ts_ls = {},
        }

        -- WARN: Ensure the servers and tools above are installed
        --
        -- To check the current status of installed tools and/or manually install
        -- other tools, you can run `:Mason`
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
        })
        require('mason-tool-installer').setup {
            ensure_installed = ensure_installed,
        }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend(
                        'force',
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end,
}
