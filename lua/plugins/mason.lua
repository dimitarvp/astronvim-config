-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bashls",
        "cssls",
        "cssmodules_ls",
        "docker-language-server",
        "docker_compose_language_service",
        "earthlyls",
        "elixirls",
        "erlangls",
        "eslint", -- Javascript, Typescript
        "gopls", -- Golang
        "golangci_lint_ls", -- Golang
        "html",
        "jsonls",
        "lemminx", -- XML
        "lexical", -- Elixir
        "lua_ls",
        "marksman", -- Markdown
        "pyright", -- Python
        "rust_analyzer",
        "sqlls",
        "taplo", -- TOML
        "ts_ls", -- Javascript, Typescript
        "vimls",
        "yamlls",
        "zk", -- Markdown
        "zls", -- Zig
        -- add more arguments for adding more language servers
      })
      opts.automatic_installation = false

      -- Explicitly exclude selene from any automatic installation
      opts.skip_setup = opts.skip_setup or {}
      table.insert(opts.skip_setup, "selene")
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "biome", -- Javascript, Typescript
        "gofumpt",
        "goimports",
        "golangci-lint", -- Golang
        "gomodifytags",
        "htmlhint",
        "nilaway", -- Golang
        "prettier", -- Javascript, Typescript
        "rubocop",
        "ruff", -- Python
        "shellcheck",
        "shellharden",
        "sqlfluff",
        "standardjs",
        "staticcheck", -- Golang
        "stylua", -- Lua
        "systemdlint",
        "tflint",
        "tfsec",
        "trivy", -- Many languages
        "vacuum", -- OpenAPI / Swagger
        "yamllint",
        -- add more arguments for adding more null-ls sources
      })

      -- Remove selene from ensure_installed if it somehow gets added by community packs
      if opts.ensure_installed then
        for i = #opts.ensure_installed, 1, -1 do
          if opts.ensure_installed[i] == "selene" then table.remove(opts.ensure_installed, i) end
        end
      end

      opts.automatic_installation = false
      opts.handlers = {
        -- Explicitly skip selene - this prevents setup even if it gets installed
        selene = function() end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
      opts.automatic_installation = false
    end,
  },

  -- Add mason-tool-installer configuration to prevent it from installing selene
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}

      -- Remove selene from ensure_installed if it's there
      for i = #opts.ensure_installed, 1, -1 do
        if opts.ensure_installed[i] == "selene" then table.remove(opts.ensure_installed, i) end
      end

      opts.auto_update = false
      opts.run_on_start = false
      return opts
    end,
  },
}
