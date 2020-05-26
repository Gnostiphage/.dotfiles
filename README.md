### These are my dotfiles.
#### There are many like them.
##### But these ones are mine.
This is mostly for me, but I figured I'd share it with whoever wants it. It uses xterm with custom colors and fonts, tmux, oh-my-tmux, zsh, oh-my-zsh, powerlevel10k, and more than a few vim plugins for some help with python, or just other general niceties. It's sort of bloated, but I like it.

Make sure you have thefuck before running `setup.sh` or edit it out of zshrc, I'd include it but it can be a pain to install on certain distros. Install grc (generic colorizer) or delete it from zshrc too, it makes output easier to read but can also be annoying to install if you're not using debian or arch.

to clone this thing, run:

`git clone --recurse-submodules git@github.com:Gnostiphage/.dotfiles.git`

or

`git clone --recurse-submodules https://github.com/Gnostiphage/.dotfiles.git`

this way the submodules from other repositories will also be pulled, nice and fresh

#### customizations:
* the uxterm.desktop file launches xterm with unicode support, with a particular nerd-font (for symbols), in fullscreen mode, with tmux (change the font if your screen is small)
* tmux uses oh-my-tmux, and I've edited the default look of oh-my-tmux to have the status bar on top, with the time in iso8601 format, and weather from wttr.in (oh-my-tmux also has custom key-bindings in addition to tmux's, similar to screen's)
* oh-my-zsh is setup with:
    * extended globbing
    * plugins:
        * git
        * colored-man-pages
        * fzf
        * thefuck
        * zsh-syntax-highlighting
    * ls grouping directories first
    * history with iso times instead of numbers
    * my own GPGKEY (fine for me, delete for thee)
    * grc output (supported applications get custom colored output)
* powerlevel10k is customized to have the fancy symbols, arrows, and different colors if you're root
* vim has too much:
    * the simple vim-plug plugin manager
    * the onedark theme (which only sort-of works)
    * fzf plugin
    * nerdcommenter
    * vista.vim
    * auto-pairs
    * vim-polyglot
    * vim-python-pep8-indent
    * ale
    * jedi-vim
    * other silly customizations
* because I often use the mouse for different windows in gnome for steam or discord or whatever, I set the mouse to active in everything, in case I'm already using the mouse and just want to fix it faster (pleb-tier, I know, but it works for me)


because it's difficult to find with a simple web-search, I'm also adding here that 'bottom' is the fun system monitor I greatly enjoy using, found here:
https://github.com/ClementTsang/bottom
