vim.g.mapleader = " "

vim.keymap.set("n", "<leader>a", "ggVG")
-- primaegen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>X", ":.lua<CR>")
vim.keymap.set("v", "<leader>X", ":lua<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>")

vim.keymap.set("n", "<leader>t", function()
  local start_pos = vim.fn.getpos("'<")[2]
  local end_pos = vim.fn.getpos("'>")[2]
  for i = start_pos, end_pos do
    local line = vim.fn.getline(i)
    print("Line " .. i .. ": " .. line)
  end
end, { desc = "Print selected lines" })

function send_reg_to_tmux(reg_id)
  local command = vim.fn.getreg(reg_id)
  local tmux_command = "tmux send-keys -t bottom '" .. command .. "' Enter"

  vim.fn.system(tmux_command)
end

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("normal! 0y$")

  send_reg_to_tmux('"')
end, { noremap = true, silent = true })

vim.keymap.set("v", "<leader>t", function()
  vim.cmd("silent normal! y")

  send_reg_to_tmux('"')
end, { noremap = true, silent = true })
