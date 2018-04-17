" Sets how many lines of history VIM has to remember
set history=1000

" 关闭vi兼容模式
set nocompatible

" Enable filetype plugins
" 允许vim加载文件类型插件，
" vim会根据检测到的文件类型，在runtimepath中搜索该类型的所有插件并执行
" 本质: 执行$VIMRUNTIME/ftplugin.vim脚本
filetype plugin on
" load filetype-specific indent files
" 允许vim为不同类型的文件定义不同的缩进格式
" $VIMRUNTIME/indent.vim
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Don't redraw while executing macros (good performance config)
set lazyredraw
" 触发Paste toggle
set pastetoggle=<F11>

" 自动补全(ctrl-p)时的一些选项：
" 多于一项时显示菜单，最长选择，
" 显示当前选择的额外信息
if v:version >= 700
    set completeopt=menu,longest,preview
endif

" 设置在状态行显示的信息如下：
" %f    当前的文件名
" %F    当前全路径文件名
" %m    当前文件修改状态
" %r    当前文件是否只读
" %Y    当前文件类型
" %{&fileformat}
"       当前文件编码
" %{&fileencoding}
"       中文编码
" %b    当前光标处字符的 ASCII 码值
" %B    当前光标处字符的十六进制值
" %l    当前光标行号
" %c    当前光标列号
" %V    当前光标虚拟列号 (根据字符所占字节数计算)
" %p    当前行占总行数的百分比
" %%    百分号
" %L    当前文件总行数
set statusline=%F%m%r\ \|\ %{&ff},%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"},%Y\ \|%=\ %l/%L,%c\ \|\ %f

" detect operating system
"------------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
"elseif has('unix')
    "let g:isunix = 1
"elseif has('mac')
    "let g:ismac= 1
else
    let g:iswindows = 0
endif

" Leader Shortcuts & Key Mapping
inoremap jk <esc>
nnoremap <space> :
nnoremap <F2> :set number!<CR>

" With a map leader it's possible to do extra key combinations
" <leader>
let mapleader = ";"
let g:mapleader = ";"
" <localleader>
" let maplocalleader = '-'
nnoremap <leader>w :w!<CR>
nnoremap <leader>W :wq<CR>
nnoremap <leader>q :q!<CR>
" 设置行号打开或关闭
nnoremap <leader>1 :setlocal number!<CR>
" 设置是否展示不可见字符
nnoremap <leader>2 :setlocal list!<CR>
" 将tab键替换为4个空格
nnoremap <leader>3 :%s/<tab>/\ \ \ \ /g<CR>

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" paste from system clipboard (Ctrl/Cmd + V)
noremap <leader>p "+p
" toggle vim paste mode
" nnoremap <leader>pp :setlocal paste!<CR>
" VIM Tabs
" Tabs
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" VIM Windows
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show line numbers
set nonumber
" highlight current line
set nocursorline
" Show matching brackets when text indicator is over them
" 高亮显示匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" A buffer becomes hidden when it is abandoned
set hidden
" Add a bit extra margin to the left
set foldcolumn=1
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" 使回格键(backspace)正常处理indent, eol, start等
" set backspace=2

" wildignore - Ignore compiled files
" tab键的自动完成现在会忽略这些
set wildignore+=*.swp
set wildignore+=*.o,*.obj,*~,*.pyc,*.luac,*.class,*.bak,*.jar,*.so
set wildignore+=*.gif,*.png,*.jpg,*.bmp
set wildignore+=*.zip,*.tar.*

" The has() function tests the presence of Vim features. more info ":help feature-list"
" There is no 'linux' feature.
if has("win32") || has("win64")
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
    set wildignore+=*.exe
elseif has("mac") || has("unix")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    set wildignore+=*DS_Store*
endif

" Search
" Ignore case when searching
" 在搜索的时候忽略大小写
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
" use: ':noh' to hide highlight
set hlsearch
" don't Highlight
" set nohlsearch

" Makes search act like search in modern browsers
" 在搜索时，输入的词句的逐字符高亮(类似firefox的搜索)
set incsearch
" For regular expressions turn magic on
set magic
" Search end

" Fold
" 允许折叠
set foldenable
" 标记折叠, marker fold (默认以标识'{{{'与'}}}'折叠代码)
set foldmethod=marker
" 手动折叠, manual fold
set foldmethod=manual
" Fold end

" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Height of the command bar, default is 1
set cmdheight=1
" show command in right bottom bar
set showcmd

" Always show the status line
set laststatus=2

" Turn on the Wild menu, allows you to use <Left> or <Righ> to navigate through the compoetion lists.
" 增强模式中的命令行, 可以自动补全(wildmenu), 并显示多个待选命令(wildmode)
set wildmenu
" allows you to expand wildmenu
set wildmode=longest:full,full
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No annoying sound on errors
set noerrorbells
set novisualbell
" t_vb: visual bell
set t_vb=
set tm=500

" Avoid garbled characters in Chinese language windows OS
" 避免windows中文乱码
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors/Fonts/Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" $VIMRUNTIME/syntax/syntax.vim
syntax enable

" colors,plugins,docs都是在VIMRUNTIME目录下的
" " VIM下: echo $VIMRUNTIME 查看
try
    colorscheme desert
catch
endtry
set background=dark
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
" encoding(enc) : encoding是Vim的内部使用编码,encoding的设置会影响Vim内部的Buffer、消息文字等。
" 在Unix环境下, encoding的默认设置等于locale;
" Windows环境下会和当前代码页相同。在中文Windows环境下encoding的默认设置是cp936(GBK).
set encoding=utf-8
" prc, simplified Chinese: on Unix euc-cn, on MS-Windows cp936
" set encoding=prc

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" 注释设置为亮绿色，方便查看
" highlight Comment ctermfg=green guifg=green

" 高亮字符，超过100列高亮预警
" highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
" match OverLength '\%101v.*'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs
" 在行和段开始处使用制表符
set smarttab
" 禁止空格代替制表符;  Makefile中不能用空格代替制表符号, 否则出现错误
set noexpandtab
" Use spaces instead of tabs
set expandtab
" number of spaces in tab when editing
" 按退格键退回缩进的长度, 结合expandtab使用
set softtabstop=4
" 1 tab == 4 spaces
" 设置制表符显示为4个空格
set tabstop=4
" 表示每一级缩进的长度, 建议与tabstop和softtabstop相同统一
set shiftwidth=4
" Linebreak on 500 characters
set linebreak
set textwidth=500

"Auto indent
set autoindent
"Smart indent
set smartindent
" 使用C样式的缩进
" set cindent

" 自动折行––将超出屏幕范围的文本打断并显示在下一行
" Wrap lines
" set wrap
" 不要打断一长行
set nowrap
" 自定义折行
set linebreak
" 由breakat选项中的字符("^I!@*-+_;:,./?")来确定折行位置
" set breakat-=_
" 设置showbreak选项，来显示折行指示信息
" set showbreak=->
" 关闭自定义折行
" set nolinebreak
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SetUpPlugins()
" 关键字修饰符（function!），指出某个函数声明可以被安全地重载；
func! SetUpPlugins()
    "https://github.com/VundleVim/Vundle.vim
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'


    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    " filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just
    " :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
endfunc

let g:vundlevimpath=$HOME."/.vim/bundle/Vundle.vim"
if isdirectory(g:vundlevimpath)
    let g:isvundlevim="true"
    " set up vim plugins
    call SetUpPlugins()
else
    let g:isvundlevim="false"
    " nothing to do
endif
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage:  cscope -Rbkq
" -R: 在生成索引文件时，搜索子目录树中的代码
" -b: 只生成索引文件，不进入cscope的界面
" -k: 在生成索引文件时，不搜索/usr/include目录
" -q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
if has("cscope")
    if has("mac")
        set csprg=/usr/local/bin/cscope
    else
        set csprg=/usr/bin/cscope
    endif
    set csto=1 "If 'csto' is set to zero, cscope database(s) are searched first
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" cscope 快捷键映射, Ctrl-@
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" gtags
set cscopetag                  " 使用 cscope 作为 tags 命令, CTRL-]
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
set csto=1 "If 'csto' is set to zero, cscope database(s) are searched first
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

if filereadable("GTAGS")
    set nocscopeverbose
    cs add GTAGS
    set csverb
endif
