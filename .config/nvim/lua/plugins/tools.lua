-- Various editing tools
return {
  -- Surround text objects
  { "tpope/vim-surround" },
  
  -- Comment toggling
  { 
    "numToStr/Comment.nvim", 
    config = true 
  },
  
  -- Quick jump navigation
  { 
    "phaazon/hop.nvim", 
    config = function() 
      require("hop").setup() 
    end 
  },
}
