return {                                                                                                                                              
  'nvim-telescope/telescope.nvim', tag = '0.1.8',                                                                                                     
  -- or                              , branch = '0.1.x',                                                                                              
  dependencies = { 'nvim-lua/plenary.nvim' },                                                                                                         
  config = function()                                                                                                                                 
    local telescope = require('telescope')
    
    telescope.setup({                                                                                                                                      
      defaults = {                                                                                                                                    
        hidden = true,
        file_ignore_patterns = {},                                                                                              
      }                                                                                                                                               
    })
    
    -- Override the find_files function to always show hidden files
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fg', function()
      builtin.live_grep({
        prompt_title = "Search in Project",
        additional_args = function()
          return {"--hidden", "--glob", "!node_modules/*", "--glob", "!.git/*"}
        end
      })
    end, { desc = "Advanced live grep" }) 
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files({ hidden = true, no_ignore = false })
    end, { desc = "Find files (including hidden)" })
    
    vim.keymap.set('n', '<leader>fF', function()
      builtin.find_files({ cwd = vim.fn.getcwd(), hidden = true, no_ignore = false })
    end, { desc = "Find files (cwd, including hidden)" })
  end                                                                                                                                                 
}
