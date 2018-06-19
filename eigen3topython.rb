class Eigen3topython < Formula
  desc "C++ Convex Hull Implementation and computation algorithms"
  homepage "https://github.com/jorisv/Eigen3ToPython"
  url  "https://github.com/jorisv/Eigen3ToPython.git", :branch => "master"
  head "https://github.com/jorisv/Eigen3ToPython.git"
  version "0.01"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"
  depends_on "python@2" => :recommended if MacOS.version <= :snow_leopard
  depends_on "python@3" => :optional

  def install
    cmake_args = std_cmake_args + %W[
      -DBoost_DIR=#{Formula["boost"].opt_prefix}
    ]

    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
