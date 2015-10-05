# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Sawconstraintcontroller < Formula
  desc "sawConstraintController is a cisst saw component that performs constrained optimization to plan inverse kinematics for a robot arm"
  homepage "https://github.com/jhu-saw/sawConstraintController"
  url "https://github.com/jhu-saw/sawConstraintController.git", :tag => "1.0.1"
  head "https://github.com/jhu-saw/sawConstraintController.git", :branch => "devel"
  version "1.0.1"
  #sha256 ""

  option "with-debug","build library with debug symbols enabled"
  depends_on "cmake" => :build
  depends_on "cisst" # may currently actually depend on cisst devel/HEAD version
  depends_on "cisstnetlib"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    cmake_args = std_cmake_args
    if build.with? "debug"
      cmake_args << "-DCMAKE_BUILD_TYPE=Debug"
    else
      cmake_args << "-DCMAKE_BUILD_TYPE=Release"
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
