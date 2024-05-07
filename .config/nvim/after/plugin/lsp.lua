vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>fa", function() vim.lsp.buf.format() end, opts)
    end,
})

vim.filetype.add({ extension = { templ = "templ" } })

vim.diagnostic.config({ virtual_text = false, float = { border = "single" } })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)


local lspconfig = require("lspconfig")

local function filter(arr, fn)
    if type(arr) ~= "table" then
        return arr
    end

    local filtered = {}
    for k, v in pairs(arr) do
        if fn(v, k, arr) then
            table.insert(filtered, v)
        end
    end

    return filtered
end

local function filterReactDTS(value)
    return string.match(value.targetUri, 'react/index.d.ts') == nil
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
        ["tsserver"] = function()
            lspconfig.tsserver.setup {
                -- other options
                handlers = {
                    ['textDocument/definition'] = function(err, result, method, ...)
                        if vim.tbl_islist(result) and #result > 1 then
                            local filtered_result = filter(result, filterReactDTS)
                            return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
                        end

                        vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
                    end
                }
            }
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    }
                }
            })
        end,
        ['html'] = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.html.setup({
                capabilities = capabilities,
            })
        end
    },
})
