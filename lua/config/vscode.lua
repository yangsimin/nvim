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
    },
  },
})

vim.cmd([[
  xnoremap gc <Plug>VSCodeCommentarygv
  nnoremap gc <Plug>VSCodeCommentarygv
  nnoremap gcc <Plug>VSCodeCommentaryLine
  xnoremap y y'>
  nnoremap <LEADER><ESC> :nohlsearch<CR>
  nnoremap <LEADER>rn <Cmd>call VSCodeCall('editor.action.rename')<CR>
  inoremap <C-D> <Cmd>call VSCodeCall('editor.action.addSelectionToNextFindMatch')<CR>
]])


-- Commands(:)
-- x/wq     (save and close active tab)
-- xa/wqa   (save and close all tabs)

-- Keybindings(normal mode)
-- ZZ       (save and close active tab)

-- gt       (switch next tab)
-- gT       (switch previous tab)
-- gh       (show hover)
-- gd       (go to definition)
-- gD       (peek definition)
-- <C-w>gd  (go to definition in new window)
-- gR       (enter replace mode)
-- gj       (move down in screen line)
-- gk       (move up in screen line)
-- g~       (反转大小写)
-- gu       (转换为小写)
-- gU       (转换为大写)

-- >>       (增加缩进)
-- >G       (增加缩进到文档末尾)
-- ==       (自动缩进)

-- M        (move cursor to middle)

-- zz       (reveal center)
-- zt       (reveal top)
-- zb       (reveal bottom)

-- <C-i>    (navigate forward)
-- <C-o>    (navigate back)

-- <C-w>n   (split new window)
-- <C-w>q   (close active tab)
-- <C-w>s   (split editor dowm)
-- <C-w>v   (split editor right)
-- <C-w>o   (all editors in one)

-- <C-w>=   (equally divide editor width)
-- <C-w>_   (toggle editor width)
-- <C-w>+   (increase editor height)
-- <C-w>-   (decrease editor height)
-- <C-w>>   (increase editor width)
-- <C-w><   (decrease editor width)

-- <C-w>j   (navigate down)
-- <C-w>k   (navigate up)
-- <C-w>h   (navigate left)
-- <C-w>l   (navigate right)

-- <C-w>w   (focus next window)
-- <C-w>W   (focus previous window)
-- <C-w>p   (focus previous window)


-- Keybindings(insert mode)
-- <C-r>0   (paste text from the register 0)
-- <C-r>=   (访问表达式寄存器)
-- <C-h>    (same as backspace)
-- <C-w>    (删除前一个单词)
-- <C-u>    (删除至行首)
-- <C-j>    (same as enter)
-- <C-o>    (enter normal mode then back to insert mode)


-- Keybindings(visual mode)
-- gv       (重选上次的高亮选区)
-- o        (切换高亮选区的活动端)