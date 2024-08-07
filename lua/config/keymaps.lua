local discipline = require("a33.discipline")

-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Disable q from recording a macro
keymap.set("n", "q", "<Nop>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("a33.utils").replaceHexWithHSL()
end)

-- Muren ( replace and update multiple words )
keymap.set("n", "fr", ":MurenToggle<Return>")

-- Toggle term
keymap.set("n", "<leader>t", ":ToggleTerm<cr>", opts)

-- Source graph cody keymaps

-- keymap.set("n", "<leader>ca", "<cmd>CodyAsk<cr>", opts)
-- keymap.set("v", "<leader>ca", "<esc><cmd>CodyAsk<cr>", opts)
--
-- keymap.set("n", "<leader>cd", "<cmd>CodyDo<cr>", opts)
-- keymap.set("v", "<leader>cd", "<esc><cmd>CodyDo<cr>", opts)
--
-- keymap.set("n", "<leader>cc", "<cmd>CodyCode<cr>", opts)
-- keymap.set("v", "<leader>cc", "<esc><cmd>CodyCode<cr>", opts)
--
-- keymap.set("n", "<leader>ce", "<cmd>CodyExplain<cr>", opts)
-- keymap.set("v", "<leader>ce", "<esc><cmd>CodyExplain<cr>", opts)
