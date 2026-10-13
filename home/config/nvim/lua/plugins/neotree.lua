return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader><leader>", "<cmd>Neotree toggle float reveal<cr>", desc = "Toggle Neotree" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
      },
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
