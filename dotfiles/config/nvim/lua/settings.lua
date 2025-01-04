local o = vim.opt

o.compatible = false -- Get rid of original Vi compatibility
o.lazyredraw = true -- Do not redraw screen while executing macro, commands
o.ttyfast = true -- Send more chars to the tty on redraw
o.updatetime = 100
o.tabstop = 4 -- Configure tab stop to 4 columns
o.shiftwidth = 4 --  Configure Vim indentation
o.expandtab = true --  Expand tabs to spaces
o.smarttab = true --  Remove indent spaces with a single delete
o.backspace = [[indent,eol,start]] --  Make backspace erase across lines
o.signcolumn = "yes:2"

o.listchars:append({ nbsp = "•", tab = "▸ ", trail = "¬" })

o.ignorecase = true --  Do case insensitive matching
o.incsearch = true --  Do incremetal search
o.hlsearch = true --  Highlight found pattern
o.wrap = false --  Do not wrap long lines
o.pyx = 3 --  pythonx version to 3
o.scrolloff = 2 --  Force 2 lines of Context above or below the cursor
o.showcmd = true --  Show (partial) command in status line.
o.showmatch = true --  Show matching brackets
o.nrformats = "hex" -- Recognize decimal and hex numbers, not octal
o.visualbell = false --  Disable visual bell

o.ruler = true --  Show status line with cursor position
o.laststatus = 2

o.autochdir = true -- chdir into the buffer filepath, usefull for tag file
o.eol = false -- Don't add an empty line at the end of a file
o.wildmenu = true -- Complete with CTRL-N/P
o.wildmode = "longest,list" -- Bash-style file completion
o.wildignore:append("*.pyc") -- Ignore patterns from file completion

o.foldmethod = "indent" -- fold based on indent
o.foldnestmax = 10 -- deepest fold is 10 levels
o.foldenable = false -- dont fold by default
o.foldlevel = 1

o.backup = false
o.writebackup = false

o.termguicolors = true

vim.g.loaded_python_provider = 0 -- Disable python2
vim.g.loaded_ruby_provider = 0 -- Disable ruby
vim.g.python3_host_prog = "/Users/nicolasm/.pyenv/versions/py-neovim/bin/python"
