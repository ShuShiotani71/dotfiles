" navigate vertically according to visual rows
nmap j gj
nmap k gk

" use system clipboard
" only works though if you have an extended installtion of vim
" which you can check by $ vim --version | grep clipboard
" if +clipboard then all good, elseif -clipboard then no good.
" other option is to use the vscode extension on vscode,
" with clipboard setting enabled, or neovim, or the terminal emulator or tmux
set clipboard=unnamedplus

" map jj to esc in insert mode
imap jj <Esc>

" since :w is bit hard to press and with my custom keymap
" error prone as well
nnoremap gW :w<CR>
nnoremap gX :wq<CR>
nnoremap gQ :q!<CR>

" auto reload vimrc when saved
autocmd bufwritepost .vimrc source $MYVIMRC

" Blinking vertical bar for Insert Mode
let &t_SI = "\e[5 q"
" Blinking underline for Replace Mode
let &t_SR = "\e[3 q"
" Blinking block for Normal Mode
let &t_EI = "\e[1 q"
