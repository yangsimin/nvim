local HOME = os.getenv("HOME")
vim.cmd.source(HOME .. "/.vimrc")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "XXiaoA/ns-textobject.nvim",
    config = function()
      require("ns-textobject").setup({
        disable_builtin_mapping = {
          enabled = true,
          -- list of char which shouldn't mapping by auto_mapping
          chars = { "a" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "vue",
          "typescript",
          "tsx",
        },
        sync_install = false,
        highlight = { enable = false },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
            include_surrounding_whitespace = true,
          },
        },
        incremental_selection = {
          enable = false,
          keymaps = {
            init_selection = "<C-K>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-K>",
            scope_incremental = false,
            node_decremental = "<C-J>",
          },
        },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "/", mode = { "n", "x", "o" }, function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Search Current" },
    },
  },
})

vim.cmd([[
  nmap j gj
  nmap k gk
  xnoremap gc <Cmd>lua require('vscode-neovim').call('editor.action.commentLine')<CR> 
  nnoremap gcc <Plug>VSCodeCommentaryLine
  xnoremap y y'>
  nnoremap zo <Cmd>lua require('vscode-neovim').call('editor.toggleFold')<CR>
  inoremap <C-D> <Cmd>call VSCodeCall('editor.action.addSelectionToNextFindMatch')<CR>
  nnoremap <C-Y> <Cmd>lua require('vscode-neovim').call('editorScroll', {args={to='up',by='line',value=5,revealCursor=true}})<CR>
  nnoremap <C-E> <Cmd>lua require('vscode-neovim').call('editorScroll', {args={to='down',by='line',value=5,revealCursor=true}})<CR>
  nnoremap <LEADER><ESC> :nohlsearch<CR>
  nnoremap <LEADER>rn <Cmd>call VSCodeCall('editor.action.rename')<CR>
  nnoremap <LEADER>s V$%
  nnoremap <LEADER>e <Cmd>lua require('vscode-neovim').call('workbench.action.toggleSidebarVisibility')<CR>
  nnoremap <LEADER>fb <Cmd>lua require('vscode-neovim').call('editor.action.jumpToBracket')<CR>
]])
