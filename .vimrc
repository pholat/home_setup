set nocompatible
execute pathogen#infect()
syntax on
let g:solarized_termcolors=256
colorscheme solarized
filetype indent off
filetype plugin indent on
Helptags
set term=screen-256color
set background=dark
set nocompatible
set backspace=indent,eol,start
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
set cscopequickfix=s+,c+,d+,i+,t+,e+,a+

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3

autocmd FileType make setlocal noexpandtab
nnoremap / /\v
noremap / /\v

tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * set bufhidden=hide

map <F1> :set relativenumber!<cr>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :Obsess!<cr>
nnoremap <F5> :UndotreeToggle<cr>
map <C-l> :bn<cr>
map <C-h> :bp<cr>
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" build tags of your own project with Ctrl-F12, not really used -> use & YCM instead
nnoremap <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *<CR>
nnoremap <F11> :!find -regex '.*\.\([c,C,h,H]\)\([p,P,x,X]\)*' > cscope.files && cscope -b -q -k<CR>
nnoremap <leader>= :res +10<cr>
nnoremap <leader>- :res -10<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>d :windo diffthis<cr>
nnoremap <leader>c :cexpr []<cr>
nnoremap <C-g>g :Ack <cword><cr>
nnoremap <C-g>c :Ack <cword> --cc<cr>
" This command adds logging.info in each and every python function in file
nnoremap <leader>L :%s/\(\s*\)def \(\w\S*\)\(self.*\):/\=substitute(submatch(0),submatch(0),'&\r'.submatch(1).'\tlogging.info(''File: '.expand("%p").' Line: '.line(".").' '. submatch(2).''')','g')/<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap  <silent> <space> :exe 'silent! normal! za'<cr>
inoremap <C-\> <C-x><C-u>
"Airline options"
let g:airline_powerline_fonts = 1
" Don't show seperators
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''SESSION!'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
let g:gitgutter_sign_column_always = 1
" YCM "
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

" Syntastic Setup "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_loc_list_height = 3
let g:syntastic_sh_checkers =   ['shellcheck']
let g:syntastic_loc_list_height = 5
" To use I add fe: :let g:syntastic_c_include_dirs = ['esp-open-sdk/sdk/include', 'include']"

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100

" Undotree persistent
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
 
" use jshint
let g:syntastic_javascript_checkers = ['jshint']
" show any linting errors immediately
let g:syntastic_check_on_open = 1
" ClangFormat
let g:clang_format#detect_style_file=1
let g:clang_format#style="google"

fun! Add_header()
    0read !git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
endfun

au BufNewFile,BufRead *.log set filetype=log
au BufRead,BufNewFile *.pde,*.ino set filetype=c++


au FileType gitcommit call Add_header()
" syn match comment "\v(^\s*//.*\n)+" fold

fun! Reg_to_list(findstart,base)
    let l:regs=[]
    let l:lvals=["+","%","0","1","2","3","4","5","6","7","8","9",":","*"]
    for a in range(0,len(l:lvals)-1)
        let l:tmpval=substitute(getreg(l:lvals[a]),'^ *\(.*\)','\1','')
        if ( l:tmpval =~ "[[:graph:]]" ) 
            call add(l:regs, l:tmpval)
        endif
    endfor
    return uniq(l:regs)
endfun

set completefunc=Reg_to_list
