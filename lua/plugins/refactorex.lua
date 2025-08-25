if true then return {} end

return {
  "synic/refactorex.nvim",
  ft = "elixir",
  ---@module "refactorex.nvim"
  ---@type refactorex.Config
  opts = {
    auto_update = true,
    pin_version = nil,
  },
}
