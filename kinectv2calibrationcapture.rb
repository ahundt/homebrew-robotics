class Kinectv2calibrationcapture < Formula
  desc "C++ language binding library integrating ZeroMQ with Boost Asio"
  homepage "https://github.com/giacomodabisias/kinectv2CalibrationCapture"
  url  "https://github.com/giacomodabisias/kinectv2CalibrationCapture.git", :branch => "master"
  head "https://github.com/giacomodabisias/kinectv2CalibrationCapture.git"
  version "0.01"

  depends_on "cmake" => :build
  depends_on "pcl"
  depends_on "opencv"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
