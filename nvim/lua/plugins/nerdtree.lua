return {
    {
        "preservim/nerdtree",
        cmd = { "NERDTreeToggle", "NERDTreeFind" },
        keys = {
          { "<leader>n", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
          { "<leader>f", ":NERDTreeFind<CR>", desc = "Find file in NERDTree" },
        },
        dependencies = {
          "Xuyuanp/nerdtree-git-plugin", 
        },
        config = function()
          vim.g.NERDTreeShowHidden = 1 -- Show hidden files
          vim.g.NERDTreeMinimalUI = 1  -- Simplify UI
          vim.g.NERDTreeDirArrows = 1  -- Enable arrows for directories
        end,
    },
}
