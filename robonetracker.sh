# /bin/bash
# This script is intended to setup robonetracker in ~/source/robonetracker
# with dependencies on homebrew or linuxbrew depending on the OS being used
# @author Andrew Hundt <ATHundt@gmail.com>
#
# 
# One step setup command for robonetracker:
# source <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/robonetracker.sh)

echo "Make sure you have access to https://github.com/ahundt/robonetracker"
echo "Also, know your github username and password, if you don't you'll have to finish manually!"


# stop on errors
set -e
set -u
set -x


# source: https://gist.github.com/phatblat/1713458
# Save script's current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Check if Homebrew is installed
#
which -s brew
if [[ $? != 0 ]] ; then

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
            # ...
            source <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/linuxbrew-standalone.sh)
    elif [[ "$OSTYPE" == "darwin"* ]]; then
            # Mac OSX

            # Install Homebrew
            # https://github.com/mxcl/homebrew/wiki/installation
            /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    elif [[ "$OSTYPE" == "cygwin" ]]; then
            # POSIX compatibility layer and Linux environment emulation for Windows
    elif [[ "$OSTYPE" == "msys" ]]; then
            # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    elif [[ "$OSTYPE" == "win32" ]]; then
            # I'm not sure this can happen.
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
            # ...
    else
            # Unknown.
    fi
else
    brew update
fi

#
# Check if Git is installed
#
which -s git || brew install git


cd $HOME

# lots of scientific libraries and developer tools
brew tap homebrew/science

brew install cmake git python doxygen flatbuffers
brew install boost --c++11

# brew install pcl --with-qt5 --with-openni2 --with-examples

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX

        # Enable --with cuda if you have an nvidia graphics card and cuda 7.0 or greater installed
        # install caskroom application manager
        # brew casks are only supported on mac, not linux
        brew install caskroom/cask/brew-cask
        # http://docs.nvidia.com/cuda/index.html
        #brew cask install cuda
        #brew cask install vrep
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
else
        # Unknown.
fi

brew install opencv3 --c++11 --with-contrib # --with-cuda

# from https://github.com/ahundt/homebrew-robotics
# robotics related libraries
brew tap ahundt/robotics
brew install cmake-basis --devel -v
brew install --HEAD --build-from-source --HEAD cisstnetlib # --cc=clang 
brew install cisst --devel
brew install sawconstraintcontroller --HEAD
brew install azmq --HEAD

cd $DIR

git clone git@github.com:ahundt/robonetracker.git
cd robonetracker; mkdir build; cd build; cmake ..; make -j4