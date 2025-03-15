return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	    require('nvim-treesitter.configs').setup {
		    ensure_installed = { "lua", "vim", "python", "javascript", "rust", "typescript", "tsx" },

		    sync_install = false,

		    auto_install = true,

		    indent = { enable = true },
		    incremental_selection = {
			    enable = true,
			    keymaps = {
				    init_selection = "gnn",
				    node_incremental = "grn",
				    scope_incremental = "grc",
				    node_decremental = "grm",
			    },
		    },
		    -- Enable folding with zc, zo, etc.
		    fold = { enable = true },
		    highlight = {
			    -- `false` will disable the whole extension
			    enable = true,
			    additional_vim_regex_highlighting = false,
		    },
	    }
    end
}
