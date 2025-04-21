return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Mason
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        'j-hui/fidget.nvim',
        -- Completion
        'Saghen/blink.cmp',
    },
    config = function()
        -- Run when an LSP attaches to a particular buffer.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
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

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

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

                -- Fuzzy find all the symbolsin your current document.
                map(
                    '<leader>ds',
                    require('fzf-lua').lsp_document_symbols,
                    '[D]ocument [S]ymbols'
                )

                -- Fuzzy find all symbols in your current project.
                map(
                    '<leader>ws',
                    require('fzf-lua').lsp_live_workspace_symbols,
                    '[W]orkspace [S]ymbols'
                )

                -- Rename
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Code actions
                map(
                    '<leader>ca',
                    vim.lsp.buf.code_action,
                    '[C]ode [A]ction',
                    { 'n', 'x' }
                )

                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has 'nvim-0.11' == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                -- Highlight refernces on hover
                -- When you move your cursor, the highlights will be cleared (autocmd 2).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client_supports_method(
                        client,
                        vim.lsp.protocol.Methods.textDocument_documentHighlight,
                        event.buf
                    )
                then
                    local highlight_augroup = vim.api.nvim_create_augroup(
                        'lsp-highlight',
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
                            'lsp-detach',
                            { clear = true }
                        ),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds {
                                group = 'lsp-highlight',
                                buffer = event2.buf,
                            }
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if
                    client
                    and client_supports_method(
                        client,
                        vim.lsp.protocol.Methods.textDocument_inlayHint,
                        event.buf
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

        -- Diagnostics
        vim.diagnostic.config {
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font
                    and {
                        text = {
                            [vim.diagnostic.severity.ERROR] = '󰅚 ',
                            [vim.diagnostic.severity.WARN] = '󰀪 ',
                            [vim.diagnostic.severity.INFO] = '󰋽 ',
                            [vim.diagnostic.severity.HINT] = '󰌶 ',
                        },
                    }
                or {},
            virtual_text = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }

        -- Broadcast blink.cmp capabilities to LSP servers
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- Enable the following language servers
        --  cmd (table): Override the default command used to start the server
        --  filetypes (table): Override the default list of associated filetypes for the server
        --  capabilities (table): Override fields in capabilities.
        --      Can be used to disable certain LSP features.
        --  settings (table): Override the default settings passed when initializing the server.
        --  For example, to see the options for `lua_ls`, you could go to:
        --      https://luals.github.io/wiki/settings/
        local servers = {
            clangd = {},
            gopls = {},
            pyright = {},
            lua_ls = {},
            harper_ls = {},
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
