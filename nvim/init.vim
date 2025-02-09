" ========================== PLUGINS ==========================
call plug#begin('~/.local/share/nvim/plugged')

" LSP Management
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'

" NERDTree for file navigation
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Better statusline experience
Plug 'nvim-lualine/lualine.nvim'

" 📌 Git Integration (Fugitive)
Plug 'tpope/vim-fugitive'

" 📌 Fuzzy Finder (Telescope)
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" 📌 Floating Terminal
Plug 'voldikss/vim-floaterm'

call plug#end()

" ========================== BASIC SETTINGS ==========================
set number relativenumber  " Show line numbers and relative numbers
set tabstop=4 shiftwidth=4 expandtab " Tab settings
set termguicolors          " Enable terminal color support
set ignorecase smartcase   " Case-insensitive search, except when uppercase is used
set clipboard=unnamedplus  " Use system clipboard
set scrolloff=8            " Keep space above/below cursor for better visibility
set cursorline             " Highlight cursor line
set splitbelow splitright  " Open new windows in an intuitive way
set timeoutlen=500         " Reduce key combination timeout

" ========================== ENHANCED KEYBINDINGS ==========================
" Save file
nnoremap <C-s> :w<CR>

" Close buffer
nnoremap <C-q> :bd<CR>

" Open/Close NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 📌 Fuzzy Finder (Telescope)
nnoremap <C-p> :Telescope find_files<CR>  " Find files
nnoremap <C-f> :Telescope live_grep<CR>   " Search inside files

" 📌 Goto Definition
nnoremap <C-d> :lua vim.lsp.buf.definition()<CR>

" 📌 Integrated Floating Terminal
nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>  " Close floating terminal in terminal mode

" ========================== AUTO FORMATTING ==========================
autocmd BufWritePre * lua vim.lsp.buf.format()  " Auto format code on save

" ========================== LSP CONFIGURATION ==========================
lua << EOF
local lspconfig = require'lspconfig'
local cmp = require'cmp'

-- Autocompletion configuration
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

-- LSP Servers
lspconfig.pyright.setup{}  -- Python
lspconfig.html.setup{}     -- HTML
lspconfig.cssls.setup{}    -- CSS
lspconfig.ts_ls.setup{}    -- JavaScript/TypeScript
EOF

" ========================== STATUSLINE CONFIGURATION ==========================
lua << EOF
require('lualine').setup {
  options = { theme = 'auto' }
}
EOF
