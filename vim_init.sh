#!/bin/sh
echo "mkdir -p ~/.vim/bundle"
mkdir -p ~/.vim/bundle
echo "cd ~/.vim/bundle"
cd ~/.vim/bundle
echo "git clone vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
echo "cd -"
cd -
echo "cp vimrc ~/.vimrc"
cp vimrc ~/.vimrc
echo "run vim ; PluginInstall to install plugins"
echo "need modify ~/.vim/bundle/c.vim/templetes/Templetes"

