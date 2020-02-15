autocmd TermOpen * set bufhidden=hide

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog='/home/pholat/.pyenv/versions/nvim3/bin/python'
let g:python_host_prog='/home/pholat/.pyenv/versions/nvim/bin/python'
source ~/.vimrc

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'ack.vim'
"Plug 'Colorizer'
"Plug 'copypath.vim'
"Plug 'ctrlp.vim'
"Plug 'gundo.vim'
"Plug 'html5-syntax.vim'
"Plug 'html5.vim'
"Plug 'nerdtree'
"Plug 'nvim-gdb'
"Plug 'papercolor-theme'
"Plug 'python-syntax'
"Plug 'syntax'
"Plug 'tsuquyomi'
"Plug 'typescript-vim'
"Plug 'ultisnips'
"Plug 'undotree'
"Plug 'vim-airline-themes'
"Plug 'vim-airline'
" Plug 'vim-clang-format'
"Plug 'vim-cmake'
"Plug 'vim-colors-solarized'
"Plug 'vim-dirdiff'
"Plug 'vim-fugitive'
"Plug 'vim-gitgutter'
"Plug 'vim-javascript'
"Plug 'vim-lsp-cxx-highlight'
"Plug 'vim-lua'
"Plug 'vim-markdown'
"Plug 'vim-node'
"Plug 'vim-obsession'
"Plug 'vim-openscad'
"Plug 'vim-snippets'
"Plug 'vim-tail'
"Plug 'vim-tar'
"Plug 'wstrip.vim'
call plug#end()

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
" Remap for rename current word
" esc to leave...
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
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
let g:airline#extensions#coc#enabled = 1

nmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" if ever forget again - CocCommand ->pythonInterpreter -> set proper one ...
