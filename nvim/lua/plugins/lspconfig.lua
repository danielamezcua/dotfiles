return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "b0o/schemastore.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspconfig = require("lspconfig")
        -- Setup capabilities for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        
        -- Use schemastore
        local schemastore = require("schemastore")
        
        -- Setup ESLint
        lspconfig.eslint.setup({
          capabilities = capabilities
        })
        -- Setup Typescript LSP
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
            root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        })

        -- Setup YAML LSP
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            filetypes = {"yaml", "yml"},
            settings = {
                yaml = {
                    schemaStore = {
                        enable = true,
                    },
                    schemas = schemastore.yaml.schemas(),
                    validate = true,
                    completion = true,
                    hover = true
                }
            },
            on_attach = function(client, bufnr)
                print("YAML LSP attached to buffer: " .. bufnr)
            end
        })
        
        -- LSP keybindings
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, noremap = true })
    end
}
