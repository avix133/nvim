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

function send_reg_to_tmux(reg_id)
  local tmpfile = "/tmp/nvim_tmux_buffer.sh"
  local script = vim.fn.getreg(reg_id)
  if script == nil or script == "" then
    script = " "
  end
  local file = io.open(tmpfile, "w")
  if file == nil then
    return
  end
  file:write(script)
  file:close()

  local target_pane = "bottom"
  vim.fn.system(
    string.format(
      "tmux load-buffer %s && tmux paste-buffer -t %s && tmux send-keys -t %s Enter",
      tmpfile,
      target_pane,
      target_pane
    )
  )
end

vim.keymap.set("n", "<C-t>", function()
  vim.cmd("normal! 0y$")

  send_reg_to_tmux('"')
end, { noremap = true, silent = true })

vim.keymap.set("v", "<C-t>", function()
  vim.cmd("silent normal! y")

  send_reg_to_tmux('"')
end, { noremap = true, silent = true })
