vim.g.mapleader = " "

vim.o.number = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.foldlevel = 99

-- Rebuild parsers when nvim-treesitter updates so they match its queries
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/christoomey/vim-tmux-navigator",
})

require("nvim-treesitter").install({
  "bash", "css", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
  "python", "rust", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  end,
})
