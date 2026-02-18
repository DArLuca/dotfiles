-- ========================================================================== --
-- ==                           BOOTSTRAP LAZY.NVIM                        == --
-- ========================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 
    "git", "clone", "--filter=blob:none", 
    "https://github.com/folke/lazy.nvim.git", 
    "--branch=stable", 
    lazypath 
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
-- ==                          LOAD CONFIGURATION                          == --
-- ========================================================================== --
-- Load general settings
require("config.options")

-- Load basic keymaps (which-key mappings are loaded after plugin setup)
require("config.keymaps")

-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --
-- Lazy.nvim automatically loads all files in lua/plugins/ directory
require("lazy").setup("plugins")
