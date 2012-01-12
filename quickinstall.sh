#!/bin/sh

does_folder_exist() {
  if [ -d $HOME/$1 ]
  then
    echo "**************************"
    echo "You already have a ~/$1 folder."
    echo "If you want to use this script, please backup your $1 folder first."
    echo "**************************"
    exit 1
  fi
}
file_warning() {
  echo "**************************"
  echo "You already have a ~/$1 file, please back it up."
  echo "**************************"
  exit 1
}
does_file_exist() {
  if [ -e $HOME/$1 ] 
  then 
    file_warning $1 
  fi
  if [ -h $HOME/$1 ] 
  then 
    file_warning $1 
  fi
}

does_folder_exist ".vim"
does_file_exist ".vimrc"
does_file_exist ".gvimrc"

start_dir = pwd

echo "*** Cloning repository into ~/.vim ..."
git clone git://github.com/sebastian/vim-config.git ~/.vim;
cd ~/.vim;
echo "*** Initializing submodules ..."
git submodule init;
git submodule update;
echo "*** Creating ~/.vimrc and ~/.gvimrc ..."
ln -s ~/.vim/vimrc ~/.vimrc;
ln -s ~/.vim/gvimrc ~/.gvimrc;

# Go back to the user ran this script from
cd $start_dir

# Print out some happy success messages
echo ""
echo ""
echo "*********************************************"
echo "*** Done!                                   *"
echo "*** Summary:                                *"
echo "*** cloned git reppository to ~/.vim        *"
echo "*** loaded all dependencies                 *"
echo "*** created ~/.vimrc and ~/.gvimrc files    *"
echo "*** Have a great day!                       *"
echo "*********************************************"
echo ""
echo ""
