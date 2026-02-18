-- Git integration plugins
return {
  -- Git signs in gutter
  { 
    "lewis6991/gitsigns.nvim", 
    config = true 
  }, 
  
  -- Git diff viewer
  { 
    "sindrets/diffview.nvim", 
    config = true 
  },  
  
  -- LazyGit integration
  { 
    "kdheepak/lazygit.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" } 
  }, 
}
