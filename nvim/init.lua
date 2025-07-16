vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
        
-- search telescope with cmd + p 
-- see iterm2
require("config.lazy")

-- keymaps 
vim.keymap.set('n', '<Esc>]p', require('telescope.builtin').find_files, { desc = 'Cmd+P Telescope' })

