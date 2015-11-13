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
sudo apt-get install build-essential curl g++ git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev gawk make patch tcl -y

unset LD_LIBRARY_PATH PKG_CONFIG_PATH HOMEBREW_CC
PATH=$HOME/.linuxbrew/bin:/usr/local/bin:/usr/bin:/bin

if [ ! -d "$HOME/.linuxbrew" ]; then
  yes | ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
  # hang on here. you will have to press return
  # note that even if brew doctor is a little unhappy we want to keep going
  brew doctor || true

  mkdir $HOME/.linuxbrew/lib
  ln -s lib $HOME/.linuxbrew/lib64
  ln -s $HOME/.linuxbrew/lib $HOME/.linuxbrew/lib64
  ln -s /usr/lib64/libstdc++.so.6 /lib64/libgcc_s.so.1 $HOME/.linuxbrew/lib/
fi
PATH=$HOME/.linuxbrew/lib:$PATH
export PATH
LIBRARY_PATH=$HOME/.linuxbrew/lib
export LIBRARY_PATH
LD_LIBRARY_PATH=$HOME/.linuxbrew/lib
export LD_LIBRARY_PATH

# before this, you may want to `brew edit glibc` to produce compatibility for your particular kernel, for example:
# "--enable-version=2.6.18"

#brew unlink gawk
brew install glibc
brew unlink glibc
brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
brew install binutils
brew link glibc
brew install patchelf
brew install gcc --with-glibc --only-dependencies -v
# When tested gcc was working except for the linking step, that's why it is force-accepted with ||true
# TODO: make it so force accepting isn't necessary and errors are shown correctly
brew install gcc --with-glibc -v || true
rm -f $HOME/.linuxbrew/lib/{libstdc++.so.6,libgcc_s.so.1}
#brew link gcc --overwrite
brew unlink gcc && brew link gcc
export HOMEBREW_CC=gcc

brew install bzip2 curl expat
brew install git --with-brewed-curl --with-brewed-openssl --without-tcl-tk
brew tap homebrew/dupes
brew install coreutils findutils gawk gnu-sed gnu-which grep libpng libxml2 libxslt make ncurses readline
#ln -s ncursesw/curses.h ncursesw/form.h ncursesw/ncurses.h ncursesw/term.h ncursesw/termcap.h $HOME/.linuxbrew/include/
#ln -s libncurses.a $HOME/.linuxbrew/lib/libcurses.a
#ln -s libncurses.so $HOME/.linuxbrew/lib/libcurses.so
brew install ruby
PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin
brew install hello && brew test hello; brew remove hello
