local actions = require "telescope.actions"

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      buffers = {
        initial_mode = "insert",
        -- Be able to "delete" (close) a buffer from the list of buffers.
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
        scroll_strategy = "limit",
      },
    },
  },
}
