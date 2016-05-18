class Eigenqld < Formula
  desc "Use the QLD QP solver with the Eigen3 library"
  homepage "https://github.com/jorisv/eigen-qld"
  url  "https://github.com/jorisv/eigen-qld.git", :branch => "master"
  head "https://github.com/jorisv/eigen-qld.git"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "boost"
  depends_on "gfortran"

  def install
    cmake_args = std_cmake_args + %W[
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
