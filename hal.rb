class Hal < Formula
  desc "HAL is a Hardware Abstraction Layer. Contains devices and associated device
drivers like cameras, IMUs, GPS, etc."
  homepage "https://github.com/arpg/HAL"
  url  "https://github.com/arpg/HAL.git", :branch => "master"
  head "https://github.com/arpg/HAL.git", :branch => "master"
  version "0.9"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "sophus"
  depends_on "ceres-solver"
  depends_on "glog"
  depends_on "gflags"
  depends_on "zeromq"
  depends_on "zmqpp"
  depends_on "tinyxml"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
