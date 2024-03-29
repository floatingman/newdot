let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" Plugins installed
	call plug#begin('~/.config/nvim/plugged')
	Plug 'autozimu/LanguageClient-neovim', {
				\ 'branch': 'next',
				\ 'do': 'bash install.sh',
				\}

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'scrooloose/nerdtree'
	Plug 'airblade/vim-gitgutter'
	Plug 'benizi/vim-automkdir'
	Plug 'easymotion/vim-easymotion'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'haya14busa/incsearch-easymotion.vim'
	Plug 'haya14busa/incsearch.vim'
	Plug 'justinmk/vim-dirvish'
	Plug 'matze/vim-move'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'rhysd/conflict-marker.vim'
	Plug 'sbdchd/neoformat'
	Plug 'sheerun/vim-polyglot'
	Plug 'trevordmiller/nova-vim'
	Plug 'whatyouhide/vim-lengthmatters'
	Plug 'edkolev/promptline.vim'
	Plug 'xolox/vim-misc'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'majutsushi/tagbar'
  Plug 'ludovicchabant/vim-gutentags'

  "" Markdown editing
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'vimwiki/vimwiki'
  Plug 'plasticboy/vim-markdown'
  Plug 'honza/vim-snippets'
  Plug 'elzr/vim-json'
  Plug 'godlygeek/tabular'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

  "" Mode Line config
  Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

  "" Python coding
  Plug 'vim-scripts/indentpython.vim'
	Plug 'nvie/vim-flake8'
  Plug 'vim-scripts/Pydiction'
  Plug 'klen/rope-vim'


  Plug 'kien/ctrlp.vim'
	Plug 'vifm/vifm.vim'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'pearofducks/ansible-vim'

  "" Theme related
  Plug 'luochen1990/rainbow'

  "" Coffeescript
  Plug 'kchmck/vim-coffee-script'

  "" Colorscheme
  Plug 'morhetz/gruvbox'

  call plug#end()
	"

" common vim settings
	set nocompatible
	set encoding=utf-8
	set backupdir=~/.vim/backups
	set directory=~/.vim/swaps
	set undofile
	set undodir=~/.vim/undos
	set visualbell
	set splitbelow
	set splitright
  set autoread
	set exrc
	set secure
	set nojoinspaces
	set clipboard+=unnamed
	set completeopt=preview
	set number
	set ruler
	set infercase
	set diffopt+=filler,vertical
	set breakindent
	set t_Co=256
	set expandtab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
  set nowrap
  set linebreak

" Some basics:
	filetype plugin indent on
	syntax on

  " buffers & tabs
  set hidden

  nnoremap <Tab> :tabnext<cr>
  nnoremap <S-Tab> :tabprev<cr>

  set switchbuf=usetab
  nnoremap <C-Right> :sbnext<cr>
  nnoremap <C-Left> :sbprevious<cr>

  nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
  nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<cr>

  nmap <leader>bn :enew<cr>
  nmap <leader>bq :bp <bar> bd #<cr>
  nmap <leader>bl :ls<cr>

	colorscheme gruvbox

" deoplete
	let g:deoplete#enable_at_startup = 1

" gutentags
  let g:gutentags_cache_dir = $HOME . '/.cache/ctags'

" ctrlp
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-ignore ~/.ignore -g ""'
  endif
  nmap <C-N> :CtrlPTag<cr>
  nmap <C-K> :CtrlPBuffer<cr>

" better-whitespace
  map <leader>W :ToggleWhitespace<CR>
	let g:better_whitespace_enabled = 0

" lengthmatters
	map <leader>L :LengthmattersToggle<CR>
	let g:lengthmatters_on_by_default = 0
	let g:lengthmatters_start_at_column = 130

" Nerdtree
  nnoremap <F11> :NERDTreeToggle<cr>

" tagbar
  let g:tagbar_autoclose = 1
  nnoremap <F12> :TagbarToggle<cr>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>

"" Limelight helps with editing
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'
	let g:limelight_deafault_coeffiecient = 0.7
	let g:limelight_paragraph_span = 1
	let g:limelight_bob = '^\s'
	let g:limelight_eop = '\ze\n^\s'
	let g:limelight_priority = -1
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" Nerd tree
	nnoremap <C-[> :NERDTreeToggle<cr>
	nnoremap <C-]> :NERDTreeVCS


" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-xll installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Enable Goyo by default for mutt writing
" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Automatically deletes all trailing whitespace on save
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Use the below highlight group when displaying bad whitespace is desired
	highlight BadWhitespace ctermbg=red guibg=red

" Flag tabs instead of spaces
	au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Flag Unnecessary Whitespace
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Make backspaces more powerfull
	set backspace=indent,eol,start

" Make vim aware of virtualenv
  py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

  autocmd FileType python set omnifunc=pythoncomplete#Complete

" Set syntax highlighting
	let python_highlight_all=1

" Pydiction setup
	let g:pydiction_location = '/home/dnewman/.config/nvim/plugged/Pydiction/complete-dict'

" Markdown
	au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
	au FileType markdown set autoindent
	au FileType markdown set smartindent
	au FileType markdown set list
	au FileType markdown set textwidth=115

	"" Markdown.vim
	let g:vim_markdown_folding_disabled = 1
	let g:vim_markdown_conceal = 0
	let g:tex_concearl = ""
	let g:vim_markdown_math = 1

	let g:vim_markdown_frontmatter = 1 " for YAML format
	let g:vim_markdown_toml_frontmatter = 1 " for TOML format
	let g:vim_markdown_json_frontmatter = 1 " for JSON format

"" Markdown Preview
  let g:mkdp_auto_close = 0
  nnoremap <M-m> :MarkdownPreview<CR>

" vim-airline
  let g:airline_theme = 'kolor'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'

" gitgutter
  if exists('&signcolumn')
    set signcolumn="yes"
  else
    let g:gitgutter_sign_column_always = 1
  endif

  let g:gitgutter_max_signs = 250

" LanguageClient-neovim
  let g:LanguageClient_serverCommands = {
	  		\ 'cpp': ['/usr/local/Cellar/cquery/20180718/bin/cquery',
		  	\ '--log-file=/tmp/cq.log',
			  \ '--init={"cacheDirectory":"/tmp/cquery/",
			  \									"blacklist": ["./build", "./ext"]}'],
			  \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
			  \ 'python': ['~/.asdf/shims/pyls'],
			  \ }
  let g:LanguageClient_autoStart = 1

" cscope
  if has("cscope")
	  set csprg=/usr/local/bin/cscope
	  set csto=0
	  set cst
	  set nocsverb
	  if filereadable("cscope.out")
		  cs add cscope.out
	  elseif $CSOPE_DB != ""
		  cs add $CSCOPE_DB
	  endif
  endif

" vim-fugitive
  map <leader>gs :Gstatus<cr>
  map <leader>gc :Gcommit<cr>
  map <leader>gl :Glog<cr>

" config helpers
  command! InitEdit :e ~/.config/nvim/init.vim
  command! InitSource :source ~/.config/nvim/init.vim

" project level customization
  let g:project_file_name = 'project.vim'
  if !empty(glob(expand(g:project_file_name)))
    exec 'source' fnameescape(g:project_file_name)
  endif

" Rainbows!
  let g:rainbow_active = 1

" Auto indent pasted text
  nnoremap p p=`]<C-o>
  nnoremap P P=`]<C-o>

" Folds
  set foldmethod=indent   "fold based on indent
  set foldnestmax=3       "deepest fold is 3 levels
  set nofoldenable        "don't fold by default

" Search
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

" Vim-move
  let g:move_key_modifier = 'C'
