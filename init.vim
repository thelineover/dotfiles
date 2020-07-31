""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
let mapleader = " "
noremap <leader>r :so ~/.config/nvim/init.vim <cr>
noremap <leader>rc :tabnew ~/.config/nvim/init.vim <cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')
Plug 'morhetz/gruvbox'

" Pretty dev-icons
Plug 'ryanoasis/vim-devicons'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod =':t'

" Tagbar
Plug 'majutsushi/tagbar'
nmap <silent><leader>? :TagbarToggle<cr>
let g:tagbar_width = 35
let g:tagbar_iconchars = ['↠', '↡']

" Nerdtree
Plug 'scrooloose/nerdtree'
" nmap \ <leader>q
nmap \ :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '🔰'

" Nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "🚧",
    \ "Staged"    : "📋",
    \ "Untracked" : "🔎",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "💫",
    \ "Deleted"   : "❌",
    \ "Dirty"     : "✗",
    \ "Clean"     : "🍀",
    \ 'Ignored'   : '💢',
    \ "Unknown"   : "❓"
    \ }

" Autopair close
Plug 'jiangmiao/auto-pairs'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'

" Clean Whitespace
Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

" Expand Visual-block
Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'   }
Plug 'junegunn/fzf.vim'
noremap <c-f> :Files<cr>

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
nmap <leader>gs :G<cr>

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'prettier/vim-prettier', { 'do': 'npm install'  }
Plug 'yuezk/vim-js'
noremap <leader>on :syntax on<cr>

Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
noremap <F3> :UndotreeToggle<cr>
set undodir=~/.config/nvim/undodir
set undofile

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
noremap <leader>int :CocCommand python.setInterpreter<cr>
nmap <leader>e :CocCommand explorer<cr>
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Git Gutter always shows
set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" LSP https://github.com/mattn/vim-lsp-settings
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'frazrepo/vim-rainbow'
let g:rainbow_active=1

Plug 'blueyed/vim-diminactive'
let g:diminactive_enable_focus = 1

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'easymotion/vim-easymotion'
Plug 'pechorin/any-jump.vim'

" Ctrlp
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Floating terminal
Plug 'voldikss/vim-floaterm'
nmap <leader>ter :CocCommand floaterm.new<cr>

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" CMAKE
Plug 'pboettch/vim-cmake-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown
Plug 'shime/vim-livedown'
nmap <leader>md :LivedownToggle<cr>

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

syntax on
set cursorline
set noshowmode
set list listchars=trail:»,tab:»-,eol:¬
set pastetoggle=<F2>

" Indent for global
set expandtab
set shiftwidth=4
set softtabstop=4

" Automatic indentation is good
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase

" Column limits
set colorcolumn=110
set textwidth=110
" Toggle between column widths
let g:wide_column = 1
noremap <leader>c :call ToggleColumnWidth()<cr>
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        highlight colorcolumn ctermbg=DarkGray guibg=DarkMagenta
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        highlight colorcolumn ctermbg=DarkGray guibg=DarkGray
        let g:wide_column = 1
    endif
endfunction

" Relative line number
set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Last modifed cursor position
au BufReadPost *
  \ if line("'\"") > -1 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

" Filetype
filetype plugin indent on
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal autoindent smartindent tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.launch set filetype=html
autocmd BufRead,BufNewFile *.xml set filetype=html
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split windows
nmap <leader>sp :split
nmap <leader>vsp :vsplit

" Resizing windows
noremap <leader>= :exe "resize +3" <cr>
noremap <leader>- :exe "resize -3" <cr>
noremap <leader>1 :exe "vertical resize -8" <cr>
noremap <leader>2 :exe "vertical resize +8" <cr>

" Use arrow keys to switch tabs
noremap <leader><leader><esc> :bp <BAR> bd#<cr>
" noremap <Tab> :tabnext<cr>
" noremap <S-Tab> :tabprevious<cr>
noremap <Left> :bprevious <cr>
noremap <Right> :bnext <cr>
noremap <leader>to :tabnew

" Some mistake keys
map Q gq
cmap Wq wq
cmap W w
cmap Q q

" Some useful keys
nmap <c-s> :update<cr>
vmap <c-s> <c-c> :update<cr>
imap <c-s> <c-o> :update<cr>
