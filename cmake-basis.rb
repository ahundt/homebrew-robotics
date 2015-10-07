class CmakeBasis < Formula
  desc "cmake build and installer generation tools"
  homepage "http://opensource.andreasschuh.com/cmake-basis/"
  url "http://schuhschuh.github.io/cmake-basis/", :using => :git, :tag => "v3.2.0"
  version "3.2"
  #sha256 ""

  option "without-project-tool","Don't include the app 'basisproject' which helps generate and update projects"
  option "without-docs", "Don't build man pages"
  option "with-perl", "Include the perl module"
  option "with-perl-utilities", "Include perl standardized command line utilities"
  option "with-python-utilities", "Include python standardized command line utilities"
  depends_on "cmake" => ['docs'] if  build.with?('docs')
  depends_on "cmake" => :required if !build.with?('docs')
  depends_on "doxygen" => :recommended
  depends_on :python => :required
  #depends_on :jython => :optional
  # todo: add sphinx python dependency
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  # The optional devel block is only executed if the user passes `--devel`.
  # Use this to specify a not-yet-released version of a software.
  devel do

    url "https://github.com/schuhschuh/cmake-basis.git", :using => :git, :branch => "develop"

  end

  head do

    url "https://github.com/schuhschuh/cmake-basis.git", :using => :git, :branch => "master"

  end
  
  def install

    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_DOCUMENTATION=OFF"
    if build.with? "docs"
      cmake_args << "-DUSE_Sphinx=ON"
    else
      cmake_args << "-DUSE_Sphinx=OFF"
    end
    if build.with? "perl"
      cmake_args << "-DUSE_Perl=ON"
    else
      cmake_args << "-DUSE_Perl=OFF"
    end
    if build.with? "perl-utilities"
      cmake_args << "-DBUILD_BASIS_UTILITIES_FOR_PERL=ON -DUSE_Perl=ON"
    else
      cmake_args << "-DBUILD_BASIS_UTILITIES_FOR_PERL=OFF"
    end
    if build.with? "python"
      cmake_args << "-DUSE_PythonInterp=ON"
    else
      cmake_args << "-DUSE_PythonInterp=OFF"
    end
    if build.with? "python-utilities"
      cmake_args << "-DBUILD_BASIS_UTILITIES_FOR_PYTHON=ON -DUSE_PythonInterp=ON"
    else
      cmake_args << "-DBUILD_BASIS_UTILITIES_FOR_PYTHON=OFF"
    end
    #if build.with? "jython"
    #  cmake_args << "-DUSE_JythonInterp=ON"
    #else
      cmake_args << "-DUSE_JythonInterp=OFF"
      #end
    if build.with? "project-tool"
      cmake_args << "-DBUILD_PROJECT_TOOL=ON"
    else
      cmake_args << "-DBUILD_PROJECT_TOOL=OFF"
    end
    
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *cmake_args
      system "make"
      system "make", "install"
   end
  end

  test do
    system "false"
  end
end
