-- LSP configuration
return {
  -- LSP base
  { "neovim/nvim-lspconfig" },
  
  -- Mason installer
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  
  -- Mason LSP config bridge
  { 
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 
      "williamboman/mason.nvim", 
      "neovim/nvim-lspconfig" 
    },
    config = function()
      local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not ok then
        return
      end
      
      mason_lspconfig.setup({
        ensure_installed = { "pyright", "jdtls" }
      })

      -- Check if setup_handlers exists before calling it
      if mason_lspconfig.setup_handlers then
        mason_lspconfig.setup_handlers({
          function(server_name)
            -- Don't set up jdtls here, it's handled by ftplugin/java.lua
            if server_name ~= "jdtls" then
              require("lspconfig")[server_name].setup({})
            end
          end,
        })
      end
    end
  },  

  -- Java LSP (configured via ftplugin/java.lua)
  { "mfussenegger/nvim-jdtls" },
}
