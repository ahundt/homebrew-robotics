class Trtk < Formula
  desc "Transformation and Registration Toolkit for robotics and computer integrated surgery"
  homepage "https://github.com/RWTHmediTEC/TRTK"
  url  "https://github.com/ahundt/TRTK.git", :branch => "master"
  head "https://github.com/ahundt/TRTK.git"
  version "0.01"

  depends_on "cmake"        => :build
  depends_on "flann"
  depends_on "eigen"

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
