
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "mason-org/mason.nvim",
            cmd = "Mason",
            build = ":MasonUpdate",
            opts = {}
        },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                automatic_enable = true,
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "hyprls",
                    "pyright",
                    "bashls",
                    "gopls",
                    -- "rust-analyzer",
                },
            },
        },
    },
}

