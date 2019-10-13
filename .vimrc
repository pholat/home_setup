set nocompatible
let g:pathogen_disabled = ["html5-syntax.vim", "html5.vim", "tsuquyomi", "typescript-vim", "vim-node" ]
execute pathogen#infect()
set encoding=utf-8
syntax on
set background=light
colorscheme papercolor
filetype indent off
set backspace=indent,eol,start
filetype indent plugin on
Helptags
set autoindent noexpandtab tabstop=4 shiftwidth=4
set tw=0
set cindent
set expandtab
set softtabstop=4
set smarttab
set number
set nowrap
set autoindent
set incsearch
set showmatch
set hlsearch
set completeopt=menuone,menu,longest,preview
set tags+=~/.vim/tags/cpp
set t_Co=256
set laststatus=2  
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set statusline+=%{fugitive#statusline()}
set diffopt+=iwhite
set cursorline
set foldlevel=98
set foldmethod=syntax
set fillchars=fold:\ 
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set colorcolumn=120
let g:NERDTreeIgnore=['.*CMakeFiles']

" Makefile no expand tabs
autocmd FileType make setlocal noexpandtab

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let NERDTreeMapActivateNode='<space>'
let g:wstrip_auto = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3

set list
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
nnoremap / /\v
noremap / /\v

tnoremap <Esc> <C-\><C-n>

inoremap <F1> :set relativenumber!<cr>
nnoremap <F1> :set relativenumber!<cr>
vnoremap <F1> :set relativenumber!<cr>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :Obsess!<cr>
nnoremap <F5> :UndotreeToggle<cr>
inoremap <C-l> :bn!<cr>
nnoremap <C-l> :bn<cr>
vnoremap <C-l> :bn<cr>
inoremap <C-h> :bp!<cr>
nnoremap <C-h> :bp<cr>
vnoremap <C-h> :bp<cr>
nnoremap <C-x> :bd<cr>
inoremap <C-x> :bd<cr>
vnoremap <C-x> :bd<cr>
vnoremap <C-H> :tabp<cr>
vnoremap <C-L> :tabn<cr>
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap <leader>R :GitGutterRevertHunk<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" build tags of your own project with Ctrl-F12, not really used -> use & YCM instead
nnoremap <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <C-F11> :!find -regex '.*\.\([c,C,h,H]\)\([p,P,x,X]\)*' > cscope.files && cscope -b -q -k<CR>
nnoremap <leader>= :res +10<cr>
nnoremap <leader>- :res -10<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>d :windo diffthis<cr>
nnoremap <leader>c :cexpr []<cr>
nnoremap <C-g> :Ack <cword><cr>
nnoremap <C-\>gc :Ack <cword> --cc<cr>
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'
nnoremap <expr> <Leader>R ':%s/\('.expand('<cword>').'\)/\1/g'
" This command adds logging.info in each and every python function in file
nnoremap <leader>L :%s/\(\s*\)def \(\w\S*\)\(self.*\):/\=substitute(submatch(0),submatch(0),'&\r'.submatch(1).'\tlogging.info(''File: '.expand("%p").' Line: '.line(".").' '. submatch(2).''')','g')/<cr>
nnoremap <leader>f :NERDTreeFind<cr>
let NERDTreeAutoDeleteBuffer = 1
nnoremap  <silent> <space> :exe 'silent! normal! za'<cr>
inoremap <C-\> <C-x><C-u>
"Airline options"
let g:airline_powerline_fonts = 1
" Don't show seperators
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='papercolor'
let g:airline_theme='cobalt2'
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''SESSION!'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
set signcolumn=yes
" YCM "
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion=0
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100

" Undotree persistent
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

function AddShComments(funcname)
    let  l:tmplist = ['if $?; then']
    call insert(l:tmplist,'    echo Error! command: '.a:funcname.' failed')
    call insert(l:tmplist,'    exit $?')
    call insert(l:tmplist,'fi')
    for a in l:tmplist
        call append(line('.')+l:tmpval, a)
    endfor
endfunction

vnoremap <leader>R :call AddShComments(@*)<cr>

source ~/.vim/cs/cscope_maps.vim
set cscopequickfix=s+,c+,d+,i+,t+,e+,a+
 
" use jshint
let g:syntastic_javascript_checkers = ['jshint']
" show any linting errors immediately
let g:clang_format#detect_style_file=1
let g:clang_format#style="google"
let g:chromatica#enable_at_startup=1
let g:chromatica#libclang_path='/usr/lib/llvm-6.0/lib/libclang.so'
let g:clang_format#code_style="llvm"
let g:clang_format#style_options = {
            \"ColumnLimit": 160,
            \"IndentWidth": 4,
            \"UseTab": "Never",
            \"BreakBeforeBraces": "Linux",
            \"IndentCaseLabels": "false",
            \"PointerAlignment": "Right",
            \"AlignConsecutiveAssignments": "true",
            \"AlignAfterOpenBracket": "true",
            \"AlignTrailingComments": "true" }

fun! Add_header()
    0read !git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
endfun

au BufNewFile,BufRead *.log set filetype=log
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set foldmethod=indent
au BufRead,BufNewFile *.pde,*.ino set filetype=cpp

"python with virtualenv support
:python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

au FileType gitcommit call Add_header()
" python highlighting
let g:python_highlight_all = 1
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:jedi#force_py_version = 3
nmap <leader>rn <Plug>(coc-rename)
