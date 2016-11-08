class Rbdyn < Formula
  desc "real-time control for kinematics trees and lists of kinematics trees"
  homepage "https://github.com/jrl-umi3218/RBDyn"
  url  "https://github.com/jrl-umi3218/RBDyn.git", :branch => "master"
  head "https://github.com/jrl-umi3218/RBDyn.git"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "boost"
  depends_on "spacevecalg"
  depends_on "rbdyn"
  depends_on "sch-core"
  depends_on "eigen3topython" => :recommended
  

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
