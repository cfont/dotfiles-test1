#!/bin/bash
############################
# .makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles-test1
############################

########## Variables

dir=~/dotfiles-test1                    # dotfiles directory
olddir=~/dotfiles_test1_old             # old dotfiles backup directory
files="todo.cfg vimrc vimrc-drupal"     # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/play_like_home/.$file ~/dotfiles_test1_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/play_like_home/.$file
done
