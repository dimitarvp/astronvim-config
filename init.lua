-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.wo.wrap = true
vim.wo.linebreak = true
vim.opt.termguicolors = true

require('lint').linters_by_ft = {
  clojure = { 'clj-kondo' },
  cmakefile = { 'cmakelint' },
  cpp = { 'clangtidy', 'cppcheck', 'cpplint', 'flawfinder' },
  css = { 'stylelint' },
  dotenv = { 'dotenv_linter' },
  elixir = { 'credo' },
  dockerfile = { 'hadolint', 'trivy' },
  haskell = { 'hlint' },
  go = { 'golangcilint', 'revive' },
  java = { 'checkstyle' },
  javascript = { 'biomejs', 'eslint', 'jshint', 'standardjs' },
  json = { 'jsonlint' },
  jsx = { 'biomejs' },
  kotlin = { 'ktlint' },
  latex = { 'chktex', 'lacheck' },
  lua = { 'selene' },
  markdown = { 'markdownlint', 'vale', },
  nix = { 'nix', 'statix' },
  perl = { 'checkpatch', 'perlcritic', 'perlimports' },
  php = { 'php', 'phpcs', 'phpinsights', 'phpmd', 'phpstan', 'psalm' },
  proto = { 'buf_lint' },
  python = { 'bandit', 'flake8', 'mypy', 'pycodestyle', 'pydocstyle', 'pylint', 'ruff', 'vulture' },
  ruby = { 'ruby', 'rubocop', 'standardrb' },
  shell = { 'shellcheck' },
  sql = { 'sqlfluff' },
  typescript = { 'biomejs' },
  yaml = { 'yamllint' },
  zsh = { 'zsh' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})
