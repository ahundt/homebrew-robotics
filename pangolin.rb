class Pangolin < Formula
  desc "realOpenGL display, interaction and abstracting video input"
  homepage "https://github.com/stevenlovegrove/Pangolin"
  url  "https://github.com/stevenlovegrove/Pangolin.git", :branch => "master"
  head "https://github.com/stevenlovegrove/Pangolin.git"
  version "0.3"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "glew"
  depends_on "eigen" => :recommended
  depends_on "libuvc" => :recommended
  depends_on "libdc1394" => :recommended
  depends_on "openni2" => :recommended
  depends_on "openni" => :optional
  

  def install
    cmake_args = std_cmake_args + %W[
      -DBoost_DIR=#{Formula["boost"].opt_prefix}
    ]
    
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
