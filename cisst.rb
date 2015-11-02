# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cisst < Formula
  desc "cisst combines robotics, stereo vision, intraoperative imaging, and related infrastructure"
  homepage "https://github.com/jhu-cisst/cisst"
  url "https://github.com/jhu-cisst/cisst.git", :tag => "1.0.5"
  head "https://github.com/jhu-cisst/cisst.git", :branch => "devel"
  version "1.0.5"
  #sha256 ""

  option "with-debug","build library with debug symbols enabled"
  depends_on "cmake" => :build
  depends_on "cisstnetlib" => :recommended
  depends_on "libxml2" => :recommended
  depends_on "opencv" => :optional
  depends_on "qt" => :optional
  depends_on "qt5" => :optional
  depends_on "fltk" => :optional

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    cmake_args = std_cmake_args + %W[
      -DCISST_BUILD_EXAMPLES=OFF
      -DCISST_BUILD_SHARED_LIBS=OFF
      -DCISST_BUILD_TESTS=OFF
      -DCISST_HAS_CISSTNETLIB=ON
      -DCISST_HAS_IOS=OFF
      -DCISST_HAS_JSON=OFF
      -DCISST_HAS_QT4=OFF
      -DCISST_MTS_HAS_ICE=OFF
      -DCISST_USE_EXTERNAL=OFF
      -DCISST_XML_LIB=LibXml2
      -DCISST_cisst3DUserInterface=OFF
      -DCISST_cisstCommon=ON
      -DCISST_cisstCommonXML=ON
      -DCISST_cisstInteractive=OFF
      -DCISST_cisstMultiTask=ON
      -DCISST_cisstNumerical=ON
      -DCISST_cisstOSAbstraction=ON
      -DCISST_cisstParameterTypes=ON
      -DCISST_cisstRobot=ON
      -DCISST_cisstStereoVision=OFF
      -DCISST_cisstVector=ON
      -DFORCE_CISSTNETLIB_CONFIG=ON
      -DCisstNetlib_DIR=#{Formula["cisstnetlib"].opt_prefix}/cmake
    ]

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
