# /bin/bash
set -e
set -u
set -x

cd $HOME

# TODO: The next ln -s line breaks cross compiling with multiarch, need an alternative!
#       source: http://stackoverflow.com/a/9004026/99379
if [! -d "/usr/lib64" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo ln -s /usr/lib/x86_64-linux-gnu /usr/lib64 
fi
sudo apt-get update -y
sudo apt-get update --fix-missing -y
sudo apt-get install build-essential curl g++ gfortran python-setuptools python-dev git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev gawk make patch tcl -y

export PKG_CONFIG_PATH="/usr/bin/pkg-config:$HOME/.linuxbrew/bin/pkg-config"
export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:$HOME/.linuxbrew/lib/pkgconfig"
export PATH="$HOME/.linuxbrew/bin:$PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

if [ ! -d "$HOME/.linuxbrew" ]; then
  yes | ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
  # hang on here. you will have to press return
  # note that even if brew doctor is a little unhappy we want to keep going
  brew doctor || true

  mkdir $HOME/.linuxbrew/lib
  ln -s lib $HOME/.linuxbrew/lib64
  ln -s $HOME/.linuxbrew/lib $HOME/.linuxbrew/lib64
  ln -s /usr/lib64/libstdc++.so.6 /lib64/libgcc_s.so.1 $HOME/.linuxbrew/lib/
  brew install hello && brew test hello; brew remove hello
fi

brew install pkg-config
brew tap homebrew/science
brew tap ahundt/robotics

# Add the following variables to your .bashrc or .zshrc to complete the setup:
#
# export PKG_CONFIG_PATH="/usr/bin/pkg-config:$HOME/.linuxbrew/bin/pkg-config"
# export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:$HOME/.linuxbrew/lib/pkgconfig"
# export PATH="$HOME/.linuxbrew/bin:$PATH"                                    
# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"                        
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"                     
