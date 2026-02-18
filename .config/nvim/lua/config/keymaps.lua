-- Navigation (Alt + hjkl)
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Which-key mappings (loaded after which-key plugin is available)
local function setup_which_key()
  local wk = require("which-key")
  
  wk.add({
    { "<leader>t", desc = "Terminal" },
    { "<leader>f", group = "Files" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
    { "<leader>fr", ":Telescope oldfiles<CR>", desc = "Recent Files" },
    { "<leader>x", ":NvimTreeToggle<CR>", desc = "Explorer" },
    { "<leader>vc", group = "Version Control" },
    { "<leader>vcd", ":DiffviewOpen<CR>", desc = "Diff View" },
    { "<leader>vcg", ":LazyGit<CR>", desc = "LazyGit" },
    { "<leader>r", group = "Refactor" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>ra", vim.lsp.buf.code_action, desc = "Code Action" },
    { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
    { "K", vim.lsp.buf.hover, desc = "Hover Docs" },
  })
end

return {
  setup_which_key = setup_which_key
}
