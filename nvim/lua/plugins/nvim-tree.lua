return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
    
    -- Set up keymaps for nvim-tree
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set('n', '<leader>fe', ':NvimTreeFocus<CR>', { noremap = true, silent = true, desc = "Focus NvimTree" })
    
    -- If you want nvim-tree to open automatically when vim starts up on a directory
    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1
      
      if directory then
        -- change to the directory
        vim.cmd.cd(data.file)
        -- open the tree
        require("nvim-tree.api").tree.open()
      end
    end
    
    -- Auto open when opening a directory
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
}
