vim.api.nvim_set_option("clipboard","unnamedplus")
vim.api.nvim_command("hi Normal guibg=NONE ctermbg=NONE")
vim.api.nvim_command("hi NonText guibg=NONE ctermbg=NONE")
vim.api.nvim_command("hi NvimTreeNormal guibg=NONE ctermbg=NONE")

require("andyfore.core.keymaps")
require("andyfore.core.options")
