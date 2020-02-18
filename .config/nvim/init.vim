autocmd TermOpen * set bufhidden=hide
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'preservim/nerdtree'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-obsession'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog='/home/pholat/.pyenv/versions/nvim3/bin/python'
let g:python_host_prog='/home/pholat/.pyenv/versions/nvim/bin/python'
source ~/.vimrc
let g:solarized_termcolors= 16 
let g:solarized_termtrans = 0 
let g:solarized_degrade = 0
let g:solarized_bold = 1 
let g:solarized_underline = 0 
let g:solarized_italic = 0 
let g:solarized_contrast = "high"
" normal" "high" or "low" - up and below same
let g:solarized_visibility= "high"
set background=dark
colorscheme PaperColor

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" gdb
let g:nvimgdb_disable_start_keymaps=1
let g:nvimgdb_config_override={
            \ 'key_frameup':    '',
            \ 'key_framedown':  '',
            \ }

set shortmess+=c
set signcolumn=yes
set cmdheight=1
set updatetime=300
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>F  <Plug>(coc-format-selected)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
""""""""""""" TEST
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

highlight LspCxxHlSymVariableStatic ctermfg=52
set statusline^=%{coc#status()}
nmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open '<CR>
map <C-C> "+y
