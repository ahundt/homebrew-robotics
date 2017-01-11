class Spdlog < Formula
  desc "C++ language binding library integrating ZeroMQ with Boost Asio"
  homepage "https://github.com/gabime/spdlog"
  url  "https://github.com/gabime/spdlog.git", :tag => "v0.11.0"
  head "https://github.com/gabime/spdlog.git", :branch => "master"
  version "0.11.0"

  depends_on "cmake" => :build

  def install
    cmake_args = std_cmake_args + %W[
      -DBoost_DIR=#{Formula["boost"].opt_prefix}
    ]

    system "cmake", ".", *cmake_args
    system "make", "install", "-j"
  end

  test do
    system "false"
  end
end
