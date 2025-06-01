return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "typescript",
                    "tsx",
                    "javascript",
                    "html",
                    "css",
                    "json",
                    "yaml",
                    "lua",
                    "bash",
                    "markdown",
                    "markdown_inline",
                    "regex",
                    "gitignore",
                    "dockerfile",
                    "toml",
                    "graphql",
                    "scss",
                    "prisma",
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
