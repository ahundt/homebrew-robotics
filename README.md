# homebrew-robotics

A collection of homebrew formulae for use in the field of robotics.

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

The basic setup is done! You may want to install some useful applications:

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

## Step by Step Setup for OS X and Linux

2) Setup brew for OS X or Linux
    - [Linuxbrew setup instructions](https://github.com/Homebrew/linuxbrew/wiki/Standalone-Installation)
    - [Homebrew OS X setup instructions](http://brew.sh/)
3) Check that it is setup correctly `~/.linuxbrew` on linux, `/usr/local` on OS X (look for `usr/local/Cellar`).
4) Install [Homebrew Cask](http://caskroom.io/)
5) Run `brew tap homebrew/science`, [homebrew-science](http://brew.sh/homebrew-science/) contains many scientific libraries, such as OpenCV and pcl
6) Run `brew tap ahundt/robotics` to load this set of package formulas.
7) Done!


Note that most of these forumulas need to be installed as HEAD, because there haven't been releases yet. Here is how to do it:

`brew install sawconstraintcontroller --HEAD`



---------------


#### Specific Situations

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