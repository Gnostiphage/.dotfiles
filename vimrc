"-----------------------------------------------------------------------------
" Plugins:
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" ex: Plug 'git-user/git-project'
" or: Plug 'https://*.git'
" install via :PlugInstall in vim

" Colors:
Plug 'arcticicestudio/nord-vim'

" TMUX:
Plug 'tmux-plugins/vim-tmux-focus-events'

" NERDTree:
Plug 'preservim/nerdtree'

" Fzf:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NERDCommenter:
Plug 'preservim/nerdcommenter'

" Vista:
Plug 'liuchengxu/vista.vim'

" Auto Pairing:
Plug 'jiangmiao/auto-pairs'

" Syntax Highlighting:
Plug 'sheerun/vim-polyglot'

" PEP8 Indentation:
Plug 'Vimjas/vim-python-pep8-indent'

" Linting:
Plug 'dense-analysis/ale'

" Jedi Client:
Plug 'davidhalter/jedi-vim'

" REPL:
Plug 'sillybun/vim-repl'

" Initialize plugin system
call plug#end()

"------------------------------------------------------------------------------
" NERDTree:
" open automatically if no file is specified:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open if a directory is specified:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open on ctrl+N:
map <C-N> :NERDTreeToggle<CR>

" close vim if only NERDTree is open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" file extension coloring:
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" modify below colors if desired:
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"------------------------------------------------------------------------------
" Vim Polyglot:
syntax on


"------------------------------------------------------------------------------
" NERDCommenter:
filetype plugin on

"------------------------------------------------------------------------------
" REPL:
nnoremap <leader>p :REPLToggle<Cr>
let g:repl_program = {
			\	'python': ['ipython'],
			\	'default': ['bash']
			\	}

"------------------------------------------------------------------------------
" Markdown:
function! BetterBullets()
	set formatoptions+=ro
	set breakindent
	set comments=b:*,b:-,b:+,n:>,b:1.
endfunction
autocmd Filetype markdown call BetterBullets()
autocmd Filetype text call BetterBullets()

"------------------------------------------------------------------------------
" Miscellaneous:

" Folding:
au BufNewFile,BufRead *.py set foldmethod=indent

" Tabs:
set tabstop=4
set softtabstop=4
set expandtab

" Colors:
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark
colorscheme nord

" Misc:
set fillchars+=vert:│
set mouse=a
set ttymouse=xterm2
set shiftwidth=4
set linebreak
set number
set relativenumber
set cursorline
set ignorecase
set splitbelow
set splitright
set belloff=all
set term=xterm-256color
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
