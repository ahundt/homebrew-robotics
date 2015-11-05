class Sophus < Formula
  desc "C++ implementation of Lie Groups using Eigen."
  homepage "https://github.com/arpg/Sophus"
  url  "https://github.com/arpg/Sophus.git", :branch => "master"
  head "https://github.com/arpg/Sophus.git"
  version "0.9"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
