return {
  "vim-syntastic/syntastic",
  lazy = false, -- Ensure it loads on startup
  config = function()
    -- Example configuration
    vim.g.syntastic_always_populate_loc_list = 1
    vim.g.syntastic_auto_loc_list = 1
    vim.g.syntastic_check_on_open = 1
    vim.g.syntastic_check_on_wq = 0

    -- Trigger Syntastic when leaving insert mode
    vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "*",
      callback = function()
        vim.cmd("SyntasticCheck")
      end,
    })
    -- Statusline integration
    vim.cmd([[set statusline+=%#warningmsg#]])
    vim.cmd([[set statusline+=%{SyntasticStatuslineFlag()}]])
    vim.cmd([[set statusline+=%*]])
  end,
}
