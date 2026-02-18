-- Treesitter syntax highlighting
return {
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        -- Set parser install directory
        local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
        vim.fn.mkdir(parser_install_dir, "p")
        vim.opt.runtimepath:append(parser_install_dir)
        
        configs.setup({
          parser_install_dir = parser_install_dir,
          ensure_installed = { "java", "lua", "vim", "python", "markdown" },
          sync_install = false,
          auto_install = true,
          highlight = { 
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
        })
      end
    end
  },
}
