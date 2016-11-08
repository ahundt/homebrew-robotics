class Spacevecalg < Formula
  desc "Implementation of spatial vector algebra rigid body transforms with the Eigen3 linear algebra library"
  homepage "https://github.com/jrl-umi3218/SpaceVecAlg"
  url  "https://github.com/jrl-umi3218/SpaceVecAlg.git", :branch => "master"
  head "https://github.com/jrl-umi3218/SpaceVecAlg.git"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "pybindgen" => :python
  depends_on "doxygen" => :recommended
  depends_on "eigen"
  depends_on "boost"

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
