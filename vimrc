:set number
:set ruler
:set ignorecase
:set backspace=indent,eol,start
:syntax on
:set noswapfile
:set tabstop=2
"expand tabs to spaces
:set expandtab
:set shiftwidth=2
:set list
"enable search highlighting
:set hlsearch

"color scheme
:set background=dark
:hi clear
if exists("syntax_on")
      syntax reset
      endif
"term = underline can be added to to any color setting to underline something
:hi Normal ctermfg=White guifg=White guibg=#35536f
:hi LineNr ctermfg=White guifg=#d700ff

"disable visual bell
:set novisualbell

"http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
:set laststatus=2
:set statusline= 
:set statusline+=--[%F]-
:set statusline+=[%c,%l/%L]-
:set statusline+=[%{strlen(&fenc)?&fenc:'none'}]-
:set statusline+=[%{FileSize()}]-
":set statusline+=[%03.b]
:set statusline+=[%03.b]-
"Set the color, for some reason these seem transposed.
:set statusline+=[%P] 
:hi StatusLine ctermbg=white ctermfg=black
:set enc=utf-8

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
     endif
endfunction
