set nocompatible
execute pathogen#infect()
syntax on
filetype indent off
set nocompatible
set backspace=indent,eol,start
filetype plugin indent on
Helptags
set tw=0
set cindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set number
set nowrap
set autoindent
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
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F5> :UndotreeToggle<cr>
inoremap <C-l> :bn<cr>
nnoremap <C-l> :bn<cr>
vnoremap <C-l> :bn<cr>
inoremap <C-h> :bp<cr>
nnoremap <C-h> :bp<cr>
vnoremap <C-h> :bp<cr>
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
"Autosave"
" au FocusLost * :wa "
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" build tags of your own project with Ctrl-F12
nnoremap <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *<CR>
nnoremap <C-F11> :!find -regex '.*\.\([c,C,h,H]\)\([p,P,x,X]\)*' > cscope.files && cscope -b -q -k<CR>
set tags+=~/.vim/tags/cpp
nnoremap <leader>= :res +10<cr>
nnoremap <leader>- :res -10<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
" This command adds logging.info in each and every python function in file
nnoremap <leader>L :%s/\(\s*\)def \(\w\S*\)\(self.*\):/\=substitute(submatch(0),submatch(0),'&\r'.submatch(1).'\tlogging.info(''File: '.expand("%p").' Line: '.line(".").' '. submatch(2).''')','g')/<cr>
" TODO CHECK THIS :D
nnoremap <leader>L :%s/\(\s*\)def \(\w\S*\)\(self.*\):/\=substitute(submatch(0),submatch(0),'&\r'.submatch(1).'\tlogging.info(''File: '.expand("%p").' Fun: '.submatch(2).')'')','g')/<cr>
map <C-g> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --include=[*.py] . -e " . expand("<cword>") . " " <bar> cwindow<CR>
"Airline options"
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
set laststatus=2  
let g:airline_theme='papercolor'
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
let g:gitgutter_sign_column_always = 1
set statusline+=%{fugitive#statusline()}
" YCM "
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
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

" TODO add au
map <C-g> :execute " grep -srnw --include={*.c*,*.h*,*.C*,*.H*} --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

source ~/.vim/cs/cscope_maps.vim
set cscopequickfix=s+,c+,d+,i+,t+,e+,a+
 
" use jshint
let g:syntastic_javascript_checkers = ['jshint']

" show any linting errors immediately
let g:syntastic_check_on_open = 1

fun! Add_header()
    0read !git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
endfun

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
