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

1. Setup brew for OS X or Linux
    - [Homebrew OS X setup instructions](http://brew.sh/) or paste `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` into the terminal
    - [Linuxbrew setup instructions](https://github.com/Homebrew/linuxbrew/wiki/Standalone-Installation), or paste `bash <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/linuxbrew-standalone.sh)` into the terminal
2. Linux only - add linuxbrew to `~/.bashrc`, paste `echo 'prefix=~/.linuxbrew;PATH="$prefix/bin:$prefix/sbin:$PATH" # give linuxbrew priority, see https://github.com/Homebrew/linuxbrew/' >> ~/.bashrc; source ~/.bashrc` into terminal.
3. Check that it is setup correctly `brew help` should output the homebrew help.
4. OS X only - install [Homebrew Cask](http://caskroom.io/) `brew install caskroom/cask/brew-cask`
5. Run `brew tap homebrew/science`, [homebrew-science](http://brew.sh/homebrew-science/) contains many scientific libraries, such as OpenCV and pcl
6. Run `brew tap ahundt/robotics` to load this set of package formulas.
7. Install the libraries you want to use, for example ``
7. Done!


**IMPORTANT:** most of these forumulae need to be installed as HEAD, because there haven't been releases yet. Here is how to do it:

`brew install sawconstraintcontroller --HEAD`


Specific Situations
-------------------


##### Linux or OS X quick robonetracker first setup

[robonetracker](https://github.com/ahundt/robonetracker ) is a private github repository at JHU, make sure
you have access before running this script. Also, know your github username and password,
if you don't you'll have to finish manually! Run this command to perform setup:

    bash <(curl -fsSL https://raw.githubusercontent.com/ahundt/homebrew-robotics/master/robonetracker.sh)


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