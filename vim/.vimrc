" navigate vertically according to visual rows
nmap j gj
nmap k gk

" use system clipboard
set clipboard=unnamed

" map jj to esc in normal mode
imap jj <Esc>

autocmd bufwritepost .vimrc source $MYVIMRC
