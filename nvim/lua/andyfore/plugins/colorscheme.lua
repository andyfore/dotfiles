return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    -- you can do it like this with a config function
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          aerial = false,
          barbar = false,
          beacon = false,
          cmp = true,
          coc_nvim = false,
          dashboard = true,
          fern = false,
          fidget = false,
          gitgutter = false,
          gitsigns = true,
          hop = false,
          illuminate = false,
          leap = false,
          lightspeed = false,
          lsp_saga = false,
          lsp_trouble = false,
          markdown = true,
          mini = false,
          neogit = false,
          neotree = false,
          notify = true,
          nvimtree = true,
          overseer = false,
          pounce = false,
          symbols_outline = false,
          telekasten = false,
          telescope = true,
          treesitter = true,
          treesitter_context = false,
          ts_rainbow = false,
          vim_sneak = false,
          vimwiki = false,
          which_key = false,

          -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
          dap = {
            enabled = false,
            enable_ui = false,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          navic = {
            enabled = false,
            custom_bg = "NONE",
          },
        },
      })
    end,
    -- or just use opts table
    opts = {
      -- configurations
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        splits = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
