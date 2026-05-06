local cursor_group = vim.api.nvim_create_augroup("CursorManagement", { clear = true })

-- 1. When entering Neovim: Set customized shapes of cursors for different modes
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  group = cursor_group,
  pattern = "*",
  callback = function()
    -- definition of each cusor shape and blink status
    vim.opt.guicursor =
      "n-t:block-blinkwait0-blinkoff300-blinkon600,i-c-ci-ve-r:ver25-blinkwait0-blinkoff300-blinkon600,v:block"
  end,
})

-- 2. When leaving Neovim: Revert back to BEAM for your terminal
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = cursor_group,
  pattern = "*",
  callback = function()
    -- 'a:ver25' restores the beam cursor shape
    vim.opt.guicursor = "a:ver25-blinkwait0-blinkoff500-blinkon500"
  end,
})

--------------------------------------------------------------------------------



