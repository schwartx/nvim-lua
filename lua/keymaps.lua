local remap = vim.api.nvim_set_keymap

-- Shortcuts for editing the keymap file and reloading the config
vim.cmd [[command! -nargs=* NvimEditInit split | edit $MYVIMRC]]
vim.cmd [[command! -nargs=* NvimEditKeymap split | edit ~/.config/nvim/lua/keymaps.lua]]
vim.cmd [[command! -nargs=* NvimSourceInit luafile $MYVIMRC]]
vim.cmd [[command! -nargs=* NvimReload lua require('nvim-reload').Reload()]]
vim.cmd [[command! -nargs=* NvimRestart lua require('nvim-reload').Restart()]]

-- Use ':Grep' or ':LGrep' to grep into quickfix|loclist
-- without output or jumping to first match
-- Use ':Grep <pattern> %' to search only current file
-- Use ':Grep <pattern> %:h' to search the current file dir
vim.cmd("command! -nargs=+ -complete=file Grep " ..
    "lua vim.api.nvim_exec([[grep! <args> | redraw! | copen]], true)")
vim.cmd("command! -nargs=+ -complete=file LGrep " ..
    "lua vim.api.nvim_exec([[lgrep! <args> | redraw! | lopen]], true)")

remap('', '<leader>ei', '<Esc>:NvimEditInit<CR>',   { silent = true })
remap('', '<leader>ek', '<Esc>:NvimEditKeymap<CR>', { silent = true })
remap('', '<leader>R',  "<Esc>:NvimReload<CR>",     { silent = true })

-- -- Fix common typos
-- vim.cmd([[
--     cnoreabbrev W! w!
--     cnoreabbrev Q! q!
--     cnoreabbrev Qa! qa!
--     cnoreabbrev Qall! qall!
--     cnoreabbrev Wq wq
--     cnoreabbrev Wa wa
--     cnoreabbrev wQ wq
--     cnoreabbrev WQ wq
--     cnoreabbrev W w
--     cnoreabbrev Q q
--     cnoreabbrev Qa qa
--     cnoreabbrev Qall qall
-- ]])

-- -- <ctrl-s> to Save
-- remap('n', '<C-S>', '<esc>:update<cr>', { silent = true })
-- remap('v', '<C-S>', '<esc>:update<cr>', { silent = true })
-- remap('i', '<C-S>', '<esc>:update<cr>', { silent = true })

-- Beginning and end of line in `:` command mode
remap('c', '<C-a>', '<home>', {})
remap('c', '<C-e>', '<end>' , {})

-- Terminal mappings
remap('t', '<M-[>', [[<C-\><C-n>]],      { noremap = true })
remap('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true })
remap('t', '<M-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']],
    { noremap = true, expr = true })

-- Navigate buffers
remap('n', '[b', ':bprevious<CR>',      { noremap = true })
remap('n', ']b', ':bnext<CR>',          { noremap = true })
remap('n', '[B', ':bfirst<CR>',         { noremap = true })
remap('n', ']B', ':blast<CR>',          { noremap = true })
-- Quickfix list mappings
remap('n', '<leader>q', "<cmd>lua require'utils'.toggle_qf('q')<CR>", { noremap = true })
remap('n', '[q', ':cprevious<CR>',      { noremap = true })
remap('n', ']q', ':cnext<CR>',          { noremap = true })
remap('n', '[Q', ':cfirst<CR>',         { noremap = true })
remap('n', ']Q', ':clast<CR>',          { noremap = true })
-- Location list mappings
remap('n', '<leader>Q', "<cmd>lua require'utils'.toggle_qf('l')<CR>", { noremap = true })
remap('n', '[l', ':lprevious<CR>',      { noremap = true })
remap('n', ']l', ':lnext<CR>',          { noremap = true })
remap('n', '[L', ':lfirst<CR>',         { noremap = true })
remap('n', ']L', ':llast<CR>',          { noremap = true })
-- Tags / Preview tags
remap('n', '[t', ':tprevious<CR>',      { noremap = true })
remap('n', ']t', ':tNext<CR>',          { noremap = true })
remap('n', '[T', ':tfirst<CR>',         { noremap = true })
remap('n', ']T', ':tlast<CR>',          { noremap = true })
remap('n', '[p', ':ptprevious<CR>',     { noremap = true })
remap('n', ']p', ':ptnext<CR>',         { noremap = true })
--remap('n', '<Leader>ts', ':<C-u>tselect <C-r><C-w><CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<up>', "v:count == 0 ? 'gk' : '<up>'",
    { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('v', '<up>', "v:count == 0 ? 'gk' : '<up>'",
    { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', '<down>', "v:count == 0 ? 'gj' : '<down>'",
    {noremap= true, expr = true, silent = true})
vim.api.nvim_set_keymap('v', '<down>', "v:count == 0 ? 'gj' : '<down>'",
    {noremap= true, expr = true, silent = true})

-- Search and Replace
-- 'c.' for word, '<leader>c.' for WORD
remap('n', 'c.',         [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true })
remap('n', '<leader>c.', [[:%s/\<<C-r><C-a>\>//g<Left><Left>]], { noremap = true })

-- Turn off search matches with double-<Esc>
remap('n', '<Esc><Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })

-- Toggle display of `listchars`
remap('n', '<leader>\'', '<Esc>:set list!<CR>',   { noremap = true, silent = true })

-- Toggle colored column at 81
remap('n', '<leader>|',
    ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>', 
    { noremap = true, silent = true })
