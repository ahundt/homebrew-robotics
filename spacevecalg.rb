class Spacevecalg < Formula
  desc "Implementation of spatial vector algebra with the Eigen3 linear algebra library"
  homepage "https://github.com/jorisv/SpaceVecAlg"
  url  "https://github.com/jorisv/SpaceVecAlg.git", :branch => "master"
  head "https://github.com/jorisv/SpaceVecAlg.git"
  version "0.1"

  depends_on "cmake" => :build
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
