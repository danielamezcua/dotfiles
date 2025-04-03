return {
    "williamboman/mason.nvim",
    priority = 100,
    config = function()
        require("mason").setup()
    end
}
