class Libnabo < Formula
  desc "A fast K Nearest Neighbor library for low-dimensional spaces"
  homepage "https://github.com/ethz-asl/libnabo"
  url  "https://github.com/ethz-asl/libnabo.git", :branch => "master"
  head "https://github.com/ethz-asl/libnabo.git"
  version "1.0.6"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"

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
