return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>e", mode = { "n", "x", "o" }, false },
    {
      "<leader>1",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
  },
}
