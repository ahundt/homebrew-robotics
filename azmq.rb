class Azmq < Formula
  desc "C++ language binding library integrating ZeroMQ with Boost Asio"
  homepage "https://github.com/zeromq/azmq"
  url  "https://github.com/zeromq/azmq.git", :branch => "master"
  head "https://github.com/zeromq/azmq.git"
  version "0.01"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "zeromq"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
