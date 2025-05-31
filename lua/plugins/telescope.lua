return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    defaults = {
      mappings = {
        i = {
          ["<C-CR>"] = function(...)
            return require("telescope.actions").select_vertical(...)
          end,
        },
      },
    },
  },
}
