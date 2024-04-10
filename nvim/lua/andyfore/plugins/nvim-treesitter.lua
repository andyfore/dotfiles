return {
  "nvim-treesitter/nvim-treesitter",
    config = function()
        -- setup treesitter with config
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
    dependencies = {
        -- NOTE: additional parser
        { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
}
