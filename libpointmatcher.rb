class Libpointmatcher < Formula
  desc "An Iterative Closest Point library for 2-D/3-D mapping in robotic
"
  homepage "https://github.com/ethz-asl/libpointmatcher"
  url  "https://github.com/ethz-asl/libpointmatcher.git", :branch => "master"
  head "https://github.com/ethz-asl/libpointmatcher.git"
  version "1.2.1"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"
  depends_on "libnabo"

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
