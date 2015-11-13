# homebrew-robotics

A collection of [homebrew formulae](https://brew.sh) for use in the field of robotics.

### Libraries to install once set up:

#### [grl](https://github.com/ahundt/grl/) generic robotics library

grl implements control of the kuka iiwa arm and integrates hand eye calibration with [vrep](http://www.coppeliarobotics.com/index.html)

    brew install grl

#### [cisst](https://github.com/jhu-cisst/cisst) is the JHU computer integrated surgery library

    brew install cisst

#### [camodocal](https://github.com/hengli/camodocal) multiple camera calibration library

camodocal is a well written library with calibration of cameras and hand eye calibration. 

    brew install camodocal

## OS X Quick Setup

```bash
# install homebrew package manager
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install caskroom application manager
brew install caskroom/cask/brew-cask
# tap homebrew-science package repository
brew tap homebrew/science
# tap ahundt-robotics repository
brew tap ahundt/robotics
```

The basic setup is done! You may want to install some useful applications as well:

```
# caskroom is for installing full applications
brew install caskroom
#  NVIDIA CUDA
brew install Caskroom/cask/cuda
# Coppelia robotics' vrep robot simulator
brew install Caskroom/cask/vrep
```

## Step by Step Setup for OS X and Linux

1. Setup brew for OS X or Linux
    - [Homebrew OS X setup instructions](http://brew.sh/) or paste `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` into the terminal
    - [Linuxbrew setup instructions](http://brew.sh/linuxbrew/), or paste `bash <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/linuxbrew.sh)` into the terminal
2. Linux only - add linuxbrew to your `~/.bashrc` or ~/.zshrc:
    export PKG_CONFIG_PATH="/usr/bin/pkg-config:$HOME/.linuxbrew/bin/pkg-config"
    export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:$HOME/.linuxbrew/lib/pkgconfig"
    export PATH="$HOME/.linuxbrew/bin:$PATH"                                    
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"                        
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
3. Check that it is setup correctly `brew help` should output the homebrew help.
4. OS X only - install [Homebrew Cask](http://caskroom.io/) `brew install caskroom/cask/brew-cask`
5. Run `brew tap homebrew/science`, [homebrew-science](http://brew.sh/homebrew-science/) contains many scientific libraries, such as OpenCV and pcl
6. Run `brew tap ahundt/robotics` to load this set of package formulas.
7. Install the libraries you want to use, for example `brew install cisst` or `brew install grl`.
8. Done!

Note that on linux you may want to use `brew install libname --env=inherit`, so it uses your native environment variable configuration.

Specific Situations
-------------------


##### Linux or OS X quick robonetracker first setup

[robonetracker](https://github.com/ahundt/robonetracker ) is a private github repository at JHU, make sure
you have access before running this script. Also, [make sure you have an ssh key configured](https://help.github.com/articles/error-permission-denied-publickey/),
if you don't you'll have to finish manually! 

First go through the step by step setup above.

Run this command to perform setup:

    bash <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/robonetracker.sh)

If you don't have access to robonetracker, run the script above for the initial setup, then you can access the open source subset of the functionality via the robone repository.

    brew install robone
    brew link --overwrite robone

Once your repository is installed, you need to install V-REP. On OS X you run:

    brew install cackroom/cask/brew-cask
    brew cask install vrep

On other platforms [download and install V-REP from the website](http://www.coppeliarobotics.com/downloads.html).

Once everything is installed you need to create symlinks in the same folder as the V-REP executable so it can find the plugins.

Find and open `SymbolicLinksRoboneSimulation.sh`. When using robone run `brew info robone` which will print the install directory, then it will be in `share/data`. With robonetracker it will be in `/path/to/robonetracker/modules/robone/data/SymbolicLinksRoboneSimulation.sh`

You will need to edit `SymbolicLinksRoboneSimulation.sh` so that all the paths are correct for your OS configuration, you will probably have to modify every variable and extension setting to be appropriate for your system. This script puts symlinks to all the relevant libraries into the directory where the vrep executable is, so you need to read the script and update the paths so they will be correctly linked into the V-REP folder. 

- `LIBDIR` - the directory relative to the installation parent level directory in which libraries are installed. Examples are /lib/Debug with Xcode and /lib with make builds.
- `LIBEXT` - the extension of the plugins. `.dylib` on OS X, `.so` on Linux.
- `TRACKERDIR` - path to robonetracker repository or if everything is installed it should be `/usr/local/`.
- `BUILDDIR` - directory where the build was created relative to TRACKERDIR. Often `/build` for `robonetracker/build`.
- `VREPDIR` - path to the directory where the vrep executable is. Note that on OS X vrep.app is a folder, and the vrep executable is in `vrep.app/Contents/MacOS`. This script will likely need some modification for non-robonetracker use cases.

After making the modifications run `./SymbolicLinksRoboneSimulation.sh`. Check the vrep directory with `ls -alh` and verify that every symlink from the vrep folder goes to a real file. Repair paths as necessary, though some may not be available depending on your configuration.

Open V-REP, `File>Open>path/to/RoboneSimulation.ttt` (In the same directory as `SymbolicLinksRoboneSimulation.sh`). This should open the demo simulation. If you hit play and see it start running that means you are now all set up! Congratulations!


##### Standalone linuxbrew installation

The default installation of linuxbrew uses dependencies provided by the OS. A consistent environment across linux versions is achivable with [standalone linuxbrew](https://github.com/Homebrew/linuxbrew/wiki/Standalone-Installation) or paste `bash <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/linuxbrew-standalone.sh)`. 

However, there are currently some bugs and complexities in using this version because every component is compiled from source, so the versions loaded and interaction of these libraries is completely separate from the underlying OS.

##### Using vmware fusion and vagrant (not working yet)
Running and testing these scripts on Ubuntu from an OS X machine with VMWare Fusion.

First install VMWare Fusion and follow all the initial setup steps above, including Homebrew Cask.


```bash
brew install Caskroom/cask/vagrant
vagrant plugin install vagrant-vmware-fusion
vagrant box add ubuntu https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vmwarefusion.box
mkdir ~/source/vagrant
cd ~/source/vagrant
vagrant init ubuntu

```


##### Using the latest source with debugging enabled

Below is an example of installing the latest cisstnetlib devel branch with debugging symbols enabled.

```bash
brew install --HEAD --cc=clang --build-from-source --with-debug -vd cisstnetlib
```


##### Some useful applications that can be installed on OS X:

```
# caskroom is for installing full applications
brew install caskroom
#  NVIDIA CUDA
brew install Caskroom/cask/cuda
# Coppelia robotics' vrep robot simulator
brew install Caskroom/cask/vrep
# VMWare fusion (requires license)
brew install Caskroom/cask/vmware-fusion
# Vagrant (command line control of VMs), requires license with VMWare, free with virualbox
brew install Caskroom/cask/vagrant
```