# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Camodocal < Formula
  desc "CamOdoCal: Automatic Intrinsic and Extrinsic Calibration of a Rig with Multiple Generic Cameras and Odometry"
  homepage "https://github.com/hengli/camodocal"
  url "https://github.com/hengli/camodocal.git", :branch => "master"
  head "https://github.com/hengli/camodocal.git", :branch => "devel"
  version "1.0.1"
  #sha256 ""

  depends_on "cmake"        => :build
  depends_on "openblas"     => :recommended
  depends_on "suite-sparse" => :required
  depends_on "eigen"        => :required
  depends_on "metis"        => :recommended
  depends_on "ceres-solver" => :recommended
  depends_on "gflags"       => :recommended
  depends_on "glog"         => :recommended
  depends_on "openblas"     => :recommended
  depends_on "opencv3"      => :recommended
  depends_on "opencv"       => :optional

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    cmake_args = std_cmake_args + %W[
      -DSUITESPARSE_DIR=#{Formula["suite-sparse"].prefix}
    ]

    if build.with? "opencv3"
      cmake_args << "-DOPENCV_DIR=#{Formula["opencv3"].prefix}"
    elsif build.with? "opencv"
      cmake_args << "-DOPENCV_DIR=#{Formula["opencv"].prefix}"
    end

    system "cmake", ".", *cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test azmq`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
