# homebrew-robotics

A collection of homebrew formulae for use in the field of robotics.

1) Install [CUDA](https://developer.nvidia.com/cuda-downloads) first if you plan to use it.
2) Setup brew for OS X or Linux
    - [Linuxbrew setup instructions](https://github.com/Homebrew/linuxbrew/wiki/Standalone-Installation)
    - [Homebrew OS X setup instructions](http://brew.sh/)
3) Check that it is setup correctly `~/.linuxbrew` on linux, `/usr/local` on OS X (look for `usr/local/Cellar`).
4) On OS X the application installer [Homebrew Cask](http://caskroom.io/) is also very useful.
5) Run `brew tap homebrew/science`, [homebrew-science](http://brew.sh/homebrew-science/) contains many scientific libraries, such as OpenCV and pcl
6) Run `brew tap ahundt/robotics` to load this set of package formulas.
7) Done!


Note that most of these forumulas need to be installed as HEAD, because there haven't been releases yet. Here is how to do it:

`brew install sawconstraintcontroller --HEAD`