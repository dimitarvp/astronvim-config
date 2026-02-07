-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Not sure I like it: does not show all LSP servers. But is otherwise prettier.
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  -- Have buffer list scoped to tabpage
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  -- Color a word that's under the cursor (all instances visible on the screen).
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- Highlights various elements in Markdown / OrgMode / Neorg files.
  { import = "astrocommunity.color.headlines-nvim" },
  -- Shows RGB and CSS named colors.
  { import = "astrocommunity.color.nvim-highlight-colors" },
  -- Dim code that's not being edited.
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- More language-aware commenting available here.
  { import = "astrocommunity.comment.ts-comments-nvim" },
  --- ??? More autocomplete strings. Might not be good, look out for it and maybe disable it.
  { import = "astrocommunity.completion.blink-cmp" },
  -- Shows LSP diagnostics with virtual lines. Shows full diagnostic always.
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  -- Allows navigating all warnings / errors in the projects and buffers.
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- Shows LSP diagnostics with virtual lines. Shows full diagnostic only when cursor is on the line.
  -- { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  -- Support DevDocs. Disabling for now, no support for Elixir.
  -- { import = "astrocommunity.editing-support.nvim-devdocs" },
  -- Shows module / function headers at the top when scrolling down.
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  -- Shows Telescope selector with all undo actions, with diffs.
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  -- Shows different space colors on different levels of indendation.
  { import = "astrocommunity.indent.indent-rainbowline" },
  -- Adds preview to LSP actions with diffs.
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  -- Adds `:IncRename` command to rename what's under the cursor.
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  -- "An asynchronous linter plugin for Neovim complementary to the built-in LSP support".
  {
    import = "astrocommunity.lsp.nvim-lint",
    opts = {
      linters_by_ft = {
        clojure = { "clj-kondo" },
        cmakefile = { "cmakelint" },
        cpp = { "clangtidy", "cppcheck", "cpplint", "flawfinder" },
        css = { "stylelint" },
        dotenv = { "dotenv_linter" },
        elixir = { "credo" },
        dockerfile = { "hadolint", "trivy" },
        haskell = { "hlint" },
        go = { "golangcilint", "revive" },
        java = { "checkstyle" },
        javascript = { "biomejs", "eslint", "jshint", "standardjs" },
        json = { "jsonlint" },
        jsx = { "biomejs" },
        kotlin = { "ktlint" },
        latex = { "chktex", "lacheck" },
        -- lua = { 'selene' },
        markdown = { "markdownlint", "vale" },
        nix = { "nix", "statix" },
        perl = { "checkpatch", "perlcritic", "perlimports" },
        php = { "php", "phpcs", "phpinsights", "phpmd", "phpstan", "psalm" },
        proto = { "buf_lint" },
        python = { "bandit", "flake8", "mypy", "pycodestyle", "pydocstyle", "pylint", "ruff", "vulture" },
        ruby = { "ruby", "rubocop", "standardrb" },
        shell = { "shellcheck" },
        sql = { "sqlfluff" },
        typescript = { "biomejs" },
        yaml = { "yamllint" },
        zsh = { "zsh" },
      },
    },
  },
  -- Adds `[e` and `]e` with which we move between edits inside the current buffer.
  { import = "astrocommunity.motion.before-nvim" },
  -- "Add/change/delete surrounding delimiter pairs with ease".
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  -- Disabled: uses invalid mason-lspconfig name "docker-language-server". Docker LSP is configured manually.
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.pkl" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.recipes.auto-session-restore" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  -- Re-enable this if I find a way to add back line:column and a number of search occurrences.
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- TODO: Uncomment this when we migrate from Telescope to Snacks
  -- { import = "astrocommunity.recipes.picker-nvchad-theme" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.utility.telescope-lazy-nvim" },
  -- import/override with your plugins folder
}
