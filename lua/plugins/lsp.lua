-- @type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Set up system selene if available
      local selene_path = vim.fn.exepath "selene"
      if selene_path ~= "" then
        opts.servers = opts.servers or {}
        opts.servers.selene = {
          cmd = { selene_path, "--lsp" },
        }
      end
      return opts
    end,
  },
}
