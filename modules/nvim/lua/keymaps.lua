vim.g.mapleader = " "

local keybind = vim.keymap.set

keybind("n", "<leader>e", vim.cmd.Ex)


local builtin = require('telescope.builtin')
keybind('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keybind('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keybind('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keybind('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keybind("v", "J", ":m '>+1<CR>gv=gv")
keybind("v", "K", ":m '<-2<CR>gv=gv")

keybind("n", "J", "mzJ`z")
keybind("n", "<C-d>", "<C-d>zz")
keybind("n", "<C-u>", "<C-u>zz")
keybind("n", "n", "nzzzv")
keybind("n", "N", "Nzzzv")


local function toggle_terminal()
  -- Check if a terminal window is already open in the current tab
  local term_win = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      term_win = win
      break
    end
  end

  if term_win then
    -- Close the terminal window if it's open
    vim.api.nvim_win_close(term_win, true)
  else
    -- Get the directory of the current file
    local current_file_dir = vim.fn.expand('%:p:h')
    
    -- Open a new terminal at the bottom in the current file's directory
    vim.cmd('bo split | lcd ' .. current_file_dir .. ' | term')
    
    -- REMOVED: vim.cmd('startinsert') 
    -- The terminal will now open in Normal mode by default
  end
end

-- Opens bottom terminal
keybind('n', '<leader>t', toggle_terminal, { desc = "Toggle Terminal" })

-- Makes entering normal mode from terminal mode easier
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = true})

-- Disable arrow keys in normal mode
keybind('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keybind('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keybind('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keybind('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
