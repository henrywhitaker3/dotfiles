return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html",
                "typescript",
                "go",
                "bash",
                "json",
                "yaml",
                "vue",
                "gitignore",
                "dockerfile",
                "markdown",
                "markdown_inline",
                "css",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
