-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "moonfly",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = function()
        local get_hlgroup = require("astroui").get_hlgroup
        -- get highlights from highlight groups
        local bg = get_hlgroup("Normal").bg
        local bg_alt = get_hlgroup("Visual").bg
        local green = get_hlgroup("String").fg
        local red = get_hlgroup("Error").fg

        return {
          -- this table overrides highlights in all themes
          Comment = { italic = false, fg = "#7687a0" },
          ["@keyword"] = { italic = false },
          RainbowDelimiterBlue = { fg = "#4D94FF" },
          RainbowDelimiterGreen = { fg = "#9EFF2E" },
          RainbowDelimiterOrange = { fg = "#FF8800" },
          RainbowDelimiterYellow = { fg = "#FFDD00" },
          -- Normal = { bg = "#000000" },

          -- return a table of highlights for snacks.picker based on
          -- colors retrieved from highlight groups
          SnacksPickerBorder = { fg = bg_alt, bg = bg },
          SnacksPicker = { bg = bg },
          SnacksPickerPreviewBorder = { fg = bg, bg = bg },
          SnacksPickerPreview = { bg = bg },
          SnacksPickerPreviewTitle = { fg = bg, bg = green },
          SnacksPickerBoxBorder = { fg = bg, bg = bg },
          SnacksPickerInputBorder = { fg = bg, bg = bg },
          SnacksPickerInputSearch = { fg = red, bg = bg },
          SnacksPickerListBorder = { fg = bg, bg = bg },
          SnacksPickerList = { bg = bg },
          SnacksPickerListTitle = { fg = bg, bg = bg },
        }
      end,
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      moonfly = {
        ["@keyword"] = { italic = false, fg = "#AE81FF" },
        ["@punctuation.delimiter"] = { fg = "#00D0D0" },
        ["@punctuation.special"] = { fg = "#FF8800" },
        ["@string"] = { fg = "#7AA26A" },
        ["@string.special.symbol"] = { fg = "#EDF7D2" },
        ["@variable"] = { fg = "#CDD6F4" },
        GitSignsAdd = { fg = "#A6E3A1" },
        GitSignsAddCul = { fg = "#A6E3A1" },
        GitSignsAddNr = { fg = "#A6E3A1" },
        GitSignsChange = { fg = "#F9E2AF" },
        GitSignsChangeCul = { fg = "#F9E2AF" },
        GitSignsChangeNr = { fg = "#F9E2AF" },
        GitSignsDelete = { fg = "#F38BA8" },
        GitSignsDeleteCul = { fg = "#F38BA8" },
        GitSignsDeleteNr = { fg = "#F38BA8" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
