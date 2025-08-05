return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      dim_inactive = { enabled = true, percentage = 0.25 },
      no_italic = true,
      highlight_overrides = {
        mocha = function(c)
          return {
            Normal = { bg = c.mantle },
            Comment = { fg = "#7687a0" },
            ["@tag.attribute"] = { style = {} },
          }
        end,
      },
    },
  },
  {
    "2giosangmitom/nightfall.nvim",
    lazy = true,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      code_style = {
        comments = "none",
      },
    },
  },
}
