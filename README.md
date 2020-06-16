### These are my dotfiles.
#### There are many like them.
##### But these ones are mine.
This is mostly for me, but I figured I'd share it with whoever wants it. It uses urxvt with custom colors and fonts, tmux, a few tmux plugins, zsh, oh-my-zsh, powerlevel10k, and more than a few vim plugins for some help with python, or just other general niceties.

Make sure you have thefuck before running `setup.sh` or edit it out of zshrc, I'd include it but it can be a pain to install on certain distros. Install grc (generic colorizer) or delete it from zshrc too, it makes output easier to read but can also be annoying to install if you're not using debian or arch.

if you're me and already setup your ssh to login to github, clone this thing by running:

`git clone --recurse-submodules git@github.com:Gnostiphage/.dotfiles.git`

otherwise,

`git clone --recurse-submodules https://github.com/Gnostiphage/.dotfiles.git`

this way the submodules from other repositories will also be pulled, nice and fresh

#### customizations:
* the urxvt.desktop file launches urxvt with tmux, with a few plugins to start it fullscreen (toggle with F11)
* consistent colors from the arcticicestudio/nord-* github, with a few tweaks
* tmux is set-up with:
    * uses symbols from nerdfonts complete (in the fonts folder)
    * weather from wttr.in (with a cron-job so as not to pull too often, and some symbol-replacement)
    * variation depending on whether it's local or remote
    * with the following plugins:
        * tmux-cpu
        * tmux-open
        * tmux-prefix-highlight
        * tmux-resurrect
        * tmux-uptime
        * tmux-yank
        * tpm
    * and makes use of some screen-like key-combinations
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
* powerlevel10k is customized to use the nerd-fonts, different direction if you're remote, and different colors if you're root
* vim :
    * the simple vim-plug plugin manager
    * fzf plugin
    * nerdcommenter
    * nerdtree
    * nord-vim
    * vista.vim
    * auto-pairs
    * vim-polyglot
    * vim-python-pep8-indent
    * vim-repl
    * vim-tmux-clipboard
    * vim-tmux-focux-events
    * ale
    * jedi-vim
    * other silly customizations
* because I often use the mouse for different windows in gnome for steam or discord or whatever, I set the mouse to active in everything, in case I'm already using the mouse and just want to mouse over and fix something


because it's difficult to find with a simple web-search, I'm also adding here that 'bottom' is the fun system monitor I greatly enjoy using, found here:
https://github.com/ClementTsang/bottom

#### screenshot:
![tmux](/screenshots/tmux.png)
