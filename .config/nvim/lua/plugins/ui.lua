-- UI and appearance plugins
return {
  -- Theme
  { 
    "folke/tokyonight.nvim", 
    lazy = false, 
    priority = 1000, 
    config = function() 
      vim.cmd[[colorscheme tokyonight]] 
    end 
  },

  -- Icons
  { 
    "nvim-tree/nvim-web-devicons", 
    lazy = true 
  },

  -- File explorer
  { 
    "nvim-tree/nvim-tree.lua", 
    config = true 
  },

  -- Fuzzy finder
  { 
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" }, 
    config = true 
  },

  -- Key bindings helper
  { 
    "folke/which-key.nvim", 
    event = "VeryLazy", 
    config = function()
      require("which-key").setup()
      -- Load keymaps after which-key is ready
      require("config.keymaps").setup_which_key()
    end 
  },

  -- Terminal
  { 
    'akinsho/toggleterm.nvim', 
    version = "*", 
    opts = {
      open_mapping = [[<leader>t]],
      direction = 'horizontal',
      size = 15,
      shell = "fish"
    }
  },
}
