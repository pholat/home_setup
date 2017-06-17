set nocompatible
execute pathogen#infect()
syntax on
set background=light
let g:solarized_termcolors=256
colorscheme solarized
filetype indent off
set nocompatible
set backspace=indent,eol,start
filetype plugin indent on
Helptags
set autoindent noexpandtab tabstop=4 shiftwidth=4
set tw=0
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
set number
set nowrap
set autoindent

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
" Makefile no expand tabs
autocmd FileType make setlocal noexpandtab

nnoremap / /\v
noremap / /\v
set incsearch
set showmatch
set hlsearch
inoremap <F1> :set relativenumber!<cr>
nnoremap <F1> :set relativenumber!<cr>
vnoremap <F1> :set relativenumber!<cr>
inoremap <F2> :copen<cr>
nnoremap <F2> :copen<cr>
vnoremap <F2> :copen<cr>
nnoremap <F3> :Obsess!<cr>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>
inoremap <C-l> :bn<cr>
nnoremap <C-l> :bn<cr>
vnoremap <C-l> :bn<cr>
inoremap <C-h> :bp<cr>
nnoremap <C-h> :bp<cr>
vnoremap <C-h> :bp<cr>
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap <leader>R :GitGutterRevertHunk<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>
"Autosave"
" au FocusLost * :wa "
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" build tags of your own project with Ctrl-F12
nnoremap <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *<CR>
nnoremap <F11> :!find -regex '.*\.\([c,C,h,H]\)\([p,P,x,X]\)*' > cscope.files && cscope -b -q -k<CR>
set tags+=~/.vim/tags/cpp
nnoremap <leader>= :res +10<cr>
nnoremap <leader>- :res -10<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>d :windo diffthis<cr>
nnoremap <leader>c :cexpr []<cr>
nnoremap <C-g> :Ack expand("<cword>")<cr>
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'
" This command adds logging.info in each and every python function in file
nnoremap <leader>L :%s/\(\s*\)def \(\w\S*\)\(self.*\):/\=substitute(submatch(0),submatch(0),'&\r'.submatch(1).'\tlogging.info(''File: '.expand("%p").' Line: '.line(".").' '. submatch(2).''')','g')/<cr>
" REMOVES not needded date... in progress
nnoremap <leader>X :%s/^\([0-9]\{2\}:\)\{2\}[0-9]\{2}\.[0-9]\{3\}\(> <[0-9]\{1,2\}>[A-Z][a-z]\{2\}\s*[0-9]\{1,2\} \)//g<cr>
"Airline options"
let g:airline_powerline_fonts = 1
" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
set laststatus=2  
let g:airline_theme='papercolor'
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''SESSION!'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
let g:gitgutter_sign_column_always = 1
set statusline+=%{fugitive#statusline()}
" YCM "
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" python - comment out"
" TODO if file *.py than inoremap <c-\> <esc>0i# <esc>
" It's better to do that in vim lang file ~/.vim/ftplugin/ "

" Syntastic Setup "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_c_checkers =   ['cppcheck']
let g:syntastic_loc_list_height = 3
let g:syntastic_sh_checkers =   ['shellcheck']
let g:syntastic_loc_list_height = 5
" To use I add fe: :let g:syntastic_c_include_dirs = ['esp-open-sdk/sdk/include', 'include']"

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

"Ack vim 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" My functions "
function AddTags()
    echom "Adding tags"
    let l:val = "!ctags -R * --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp "
    execute l:val
endfunction

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
let g:syntastic_check_on_open = 1

fun! Add_header()
    0read !git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
endfun

au BufNewFile,BufRead *.log set filetype=log

set diffopt+=iwhite

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"python with virtualenv support
py << EOF

import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

set cursorline
au FileType gitcommit call Add_header()
