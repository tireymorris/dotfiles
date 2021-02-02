" Vundle-specific

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Plugins
Plugin 'eslint/eslint'
Plugin 'herringtondarkholme/yats.vim'
Plugin 'honza/vim-snippets'
Plugin 'joshdick/onedark.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neoclide/coc-eslint'
Plugin 'neoclide/coc-highlight'
Plugin 'neoclide/coc-json'
Plugin 'neoclide/coc-pairs'
Plugin 'neoclide/coc-prettier'
Plugin 'neoclide/coc-snippets'
Plugin 'neoclide/coc-yaml'
Plugin 'neoclide/coc.nvim'
Plugin 'preservim/nerdcommenter'
Plugin 'prettier/vim-prettier'
Plugin 'ryanoasis/vim-devicons'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'yggdroot/indentline'

let g:coc_global_extensions = ['coc-tsserver', 'coc-pairs', 'coc-prettier', 'coc-snippets', 'coc-yaml', 'coc-eslint', 'coc-json']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","


" Other conf
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
set encoding=UTF-8

set number

syntax on

colorscheme onedark

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-b> :NERDTreeToggle<CR>

let g:NERDTreeChDirMode       = 2
let g:NERDTreeIgnore = ['^node_modules$', '^build$', '^dist$']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files --recurse-submodules']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|dist'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Indentline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" mappings
map <leader>g :Git<CR>
map <leader>E <Plug>(coc-diagnostic-next-error)
map <leader>e <Plug>(coc-diagnostic-next-error)


" Config for coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set timeoutlen=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippets_next = '<tab>'
let g:coc_snippets_prev = '<s-tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" end coc config

" TODO extract all these sets
set splitbelow
set splitright

" Rust
let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END


" Tyler's vimrc
set nobackup     " Disables backup files
set nowb         " Disables writeback files
set noswapfile   " Disables swap files


" Faster way of saving
nmap <leader>w :w!<cr>

" Navigating vim splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
map 0 ^

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Pop-up terminal
let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
    if win_gotoid(s:term_win)
        hide
    else
        new terminal
        exec "resize ".a:height
        try
            exec "buffer ".s:term_buf
            exec "bd terminal"
        catch
            call termopen($SHELL, {"detach": 0})
            let s:term_buf = bufnr("")
            setlocal nonu nornu scl=no nocul
        endtry
        startinsert!
        let s:term_win = win_getid()
    endif
endfunction
nnoremap <silent><A-t> :call TermToggle(12)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
