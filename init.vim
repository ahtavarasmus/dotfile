--General settings
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.compatible = false
vim.opt.ignorecase = true
vim.opt.wildmode = 'longest,list'
vim.opt.colorcolumn = '80'
vim.opt.ttyfast = true
vim.opt.swapfile = false
vim.opt.formatoptions:remove({'c', 'r', 'o'})
vim.opt.laststatus = 3  -- Required for avante.nvim

-- Disable space key and set leader
vim.keymap.set('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.avante_support_paste_image = false

-- Enable filetype plugins
vim.cmd('filetype plugin on')

-- Custom command for terminal
vim.api.nvim_create_user_command('TermNew', function()
    vim.cmd('terminal')
    vim.cmd('bdel! #')
end, {})

-- Key mappings
vim.keymap.set('i', '<Esc>', '<Esc>:w<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<CR>')
vim.keymap.set('n', 'gn', ':bn<CR>')
vim.keymap.set('n', 'gp', ':bp<CR>')
vim.keymap.set('n', 'ga', '<C-^>')
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
vim.keymap.set('n', '<leader>äf', ':terminal<CR>:file first_terminal<CR>')
vim.keymap.set('n', '<leader>äb', ':terminal<CR>:file second_terminal<CR>')
vim.keymap.set('n', '<leader>äd', ':terminal<CR>:file second_terminal<CR>:terminal<CR>:file first_terminal<CR>')
vim.keymap.set('n', '<leader>t', ':b second_terminal<CR>i<C-c><Up><CR><C-\\><C-n>:b first_terminal<CR>i<C-c><Up><CR><C-\\><C-n>')
vim.keymap.set('v', '<C-j>', '<C-d>zz')
vim.keymap.set('v', '<C-k>', '<C-u>zz')
vim.keymap.set('n', 'gy', 'ggVG"+y')
vim.keymap.set('v', 'gy', '"+y')
vim.keymap.set('n', '<leader>m', ':NERDTreeToggle<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', ':', ':<C-f>i')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('i', '<C-j>', '<C-n>')
vim.keymap.set('i', '<C-k>', '<C-p>')
vim.keymap.set('i', 'ö', '<C-y>')

-- Plugin management with vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'rebelot/terminal.nvim'
Plug 'mhartington/formatter.nvim'
-- Themes
Plug 'arcticicestudio/nord-vim'
-- Code completion
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'simrat39/rust-tools.nvim'
-- File tree
Plug('scrooloose/nerdtree', {['on'] = 'NERDTreeToggle'})
-- Highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
-- Fuzzy file finder
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {branch = '0.1.x'})

-- Avante.nvim and its dependencies
Plug 'stevearc/dressing.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'zbirenbaum/copilot.lua'
Plug 'MeanderingProgrammer/render-markdown.nvim'  -- Added this required dependency
Plug 'HakonHarnes/img-clip.nvim'
Plug('yetone/avante.nvim', {branch = 'main', ['do'] = 'make'})

vim.call('plug#end')

vim.api.nvim_create_autocmd("User", {
  pattern = "ToggleMyPrompt",
  callback = function() require("avante.config").override({system_prompt = "MY CUSTOM SYSTEM PROMPT"}) end,
})

vim.keymap.set("n", "<leader>am", function() vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" }) end, { desc = "avante: toggle my prompt" })

-- Set colorscheme
vim.cmd('colorscheme nord')

-- Disable automatic newline comments
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({'c', 'r', 'o'})
    end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "ToggleMyPrompt",
  callback = function() require("avante.config").override({system_prompt = "When editing rust code, do not use mod.rs files."}) end,
})

vim.keymap.set("n", "<leader>am", function() vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" }) end, { desc = "avante: toggle my prompt" })


local groq_api = os.getenv("GROQ_API_KEY") or "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"

-- Configure avante.nvim directly (not in an autocmd)
local status_ok, avante = pcall(require, "avante")
if status_ok then
    require('avante_lib').load()
    avante.setup({
        --provider = "groq",  -- set the provider name
        --vendors = {
        --    groq = {
        --        __inherited_from = "openai",  -- inherits settings from the openai provider
        --        api_key_name = "GROQ_API_KEY", -- environment variable containing your API key
        --        endpoint = "https://api.groq.com/openai/v1/", -- groq API endpoint
        --        model = "deepseek-r1-distill-llama-70b", -- groq model name to use
        --    },
       -- },
        provider = "claude",
        auto_suggestions_provider = "claude",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-latest",
            temperature = 0,
            max_tokens = 8192,
        },
        system_prompt = "Never read any other files independently than what the user has given you. If you need access to certain file, ask the user to provide it for you.",
        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true,
        },
        web_search_engine = {
          provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
        },
        windows = {
            position = "right",
            wrap = true,
            width = 30,
            sidebar_header = {
                enabled = true,
                align = "center",
                rounded = true,
            },
            input = {
                prefix = "> ",
                height = 8,
            },
            edit = {
                border = "rounded",
                start_insert = true,
            },
            ask = {
                floating = false,
                start_insert = true,
                border = "rounded",
                focus_on_apply = "ours",
            },
        },
    })
end

-- Configure render-markdown.nvim
require('render-markdown').setup({
    file_types = { "markdown", "Avante" },
})
