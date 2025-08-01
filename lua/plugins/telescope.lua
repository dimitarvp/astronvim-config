local actions = require "telescope.actions"

local function dynamic_preview_width()
  local cols = vim.o.columns
  if cols > 200 then
    return 0.7
  elseif cols > 120 then
    return 0.65
  else
    return 0.6
  end
end

local function get_horizontal_layout()
  return {
    preview_cutoff = 80, -- If terminal width is below that, no previews of file contents.
    width = { padding = 0 },
    height = { padding = 0 },
    preview_width = dynamic_preview_width(),
  }
end

local function get_vertical_layout()
  return {
    preview_height = 0.7,
    results_height = 0.3,
    preview_cutoff = 25,
  }
end

local function get_flex_layout()
  return {
    flip_columns = 120, -- If terminal width is below that, swap to vertical layout.
    horizontal = get_horizontal_layout(),
    vertical = get_vertical_layout(),
  }
end

local function layout_config()
  return {
    prompt_position = "top",
    height = 0.80,
    width = 0.99,
    horizontal = get_horizontal_layout(),
    flex = get_flex_layout(),
    -- `bottom_pane`, `center` and `cursor` are all layout strategies.
    -- I am not interested in them but leaving minimal examples for reference / completeness.
    -- bottom_pane = {
    --   height = 25,
    --   preview_cutoff = 120,
    -- },
    -- center = {
    --   height = 0.4,
    --   preview_cutoff = 40,
    --   width = 0.5,
    -- },
    -- cursor = {
    --   preview_cutoff = 40,
    -- },
  }
end

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "flex", -- or "horizontal"
      layout_config = layout_config(),
      prompt_prefix = "🔎 ",
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
    },
    pickers = {
      find_files = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
      },
      live_grep = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
      },
      grep_string = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
      },
      buffers = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
        initial_mode = "insert",
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
      oldfiles = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
      },
      git_files = {
        layout_strategy = "horizontal",
        layout_config = layout_config(),
      },
    },
  },
}
