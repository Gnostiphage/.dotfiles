#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any 
# desired dotfiles in ~/.dotfiles, while also setting up the 
# pulled github repos for different plugins, so that they 
# work appropriately
############################

## Variables

dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="vimrc vim zshrc oh-my-zsh tmux tmux.conf tmux.conf.local tmux.conf.remote gitconfig Xresources fzf"    # list of files/folders to symlink in homedir

##

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
mv ~/.p10k.zsh $olddir/

# if root, use root p10k (more colorful)
if [ "$EUID" -eq 0 ] ; then
    ln -s $dir/p10k-root.zsh ~/.p10k.zsh
else
    ln -s $dir/p10k.zsh ~/.p10k.zsh
fi

# link uxterm.desktop to .local/share/applications, for easy access
ln -s $dir/uxterm-256color-tmux.desktop ~/.local/share/applications/uxterm-256color-tmux.desktop

# link oh-my-zsh addons into the appropriate oh-my-zsh folder (as you can't load submodules into subdirectories directly)
ln -s ../../../powerlevel10k $dir/oh-my-zsh/custom/themes/powerlevel10k
ln -s ../../../zsh-syntax-highlighting $dir/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# link tmux plugins into the appropriate tmux folder (for the same reason):
ln -s ../tmux-plugins $dir/tmux/plugins

# copy required MesloLGS fonts (with NerdFonts) in home .fonts folder
mkdir -p ~/.fonts
cp $dir/p10k-media/*.ttf ~/.fonts/

# if fzf isn't installed, install it
if [ ! -f /usr/bin/fzf ]; then
    ~/.fzf/install
fi

# setup cron job to update the weather every 15m
# (my tmux's status-interval of 1s would hog the 
# expensive weather APIs/bandwidth otherwise)
crontab -l > $dir/mycron
if grep "wttr.sh" $dir/mycron ; then
    echo "wttr.in cron job already setup"
else
    echo "creating wttr.in cron job"
    echo "*/15 * * * * $dir/wttr.sh" >> $dir/mycron
    crontab $dir/mycron
fi
rm $dir/mycron

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
        if [[ -f /etc/arch-release  ]]; then
            sudo pacman -S zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
