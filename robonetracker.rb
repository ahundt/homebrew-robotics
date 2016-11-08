class Robonetracker < Formula
  desc "Robone project at Johns Hopkins University. This is a private repository. Contact: ATHundt@gmail.com"

  homepage "https://github.com/ahundt/robonetracker"
  url "git@github.com:ahundt/robonetracker.git", :using => :git, :branch => "master"
  version "2.0.2"

  option "with-debug","build library with debug symbols enabled"
  option "without-example", "Include example code"
  option "without-testing", "Include testing code"
  option "docs", "build docs"
  depends_on "cmake" => :build
  depends_on "cmake-basis" => :build
  depends_on "opencv"  => :recommended
  depends_on "opencv3" => :optional
  depends_on "flatbuffers"
  depends_on "boost"
  depends_on "eigen"
  depends_on "zeromq"
  depends_on "azmq"
  depends_on "protobuf"
  depends_on "tbb" # camodocal
  depends_on "glog" # camodocal
  depends_on "gflags" # camodocal
  depends_on "homebrew/science/suite-sparse" # camodocal
  depends_on "tasks" => :recommended
  depends_on "cisstnetlib" => :recommended
  depends_on "cisst" => :recommended
  depends_on "ur_modern_driver" => :recommended
  
  head do

    url "git@github.com:ahundt/robonetracker.git", :using => :git, :branch => "master"

  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    cmake_args = std_cmake_args + %W[
      -DBUILD_ALL_MODULES=ON
      -DBASIS_DIR=#{Formula["cmake-basis"].opt_prefix}/lib/cmake/basis
    ]


    if build.with? "opencv3"
      cmake_args << "-DOPENCV_DIR=#{Formula["opencv3"].prefix}"
    elsif build.with? "opencv"
      cmake_args << "-DOPENCV_DIR=#{Formula["opencv"].prefix}"
    end

    if build.with? "debug"
      cmake_args << "-DCMAKE_BUILD_TYPE=Debug"
    else
      cmake_args << "-DCMAKE_BUILD_TYPE=Release"
    end

    if build.with? "docs"
      cmake_args << "-DBUILD_DOCUMENTATION=ON"
    else
      cmake_args << "-DBUILD_DOCUMENTATION=OFF"
    end

    if build.with? "testing"
      cmake_args << "-DBUILD_TESTING=ON"
    else
      cmake_args << "-DBUILD_TESTING=OFF"
    end

    if build.with? "cisst"
      cmake_args << "-Dcisst_DIR=#{Formula["cisst"].opt_prefix}/cmake"
    end

    if build.with? "cisstnetlib"
      cmake_args << "-DCisstNetlib_DIR=#{Formula["cisstnetlib"].opt_prefix}/cmake"
    end

    if build.with? "ur_modern_driver"
      cmake_args << "-Dur_modern_driver_DIR=#{Formula["ur_modern_driver"].opt_prefix}/cmake"
    end

    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test grl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
