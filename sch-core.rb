class SchCore < Formula
  desc "C++ Convex Hull Implementation and computation algorithms"
  homepage "https://github.com/jrl-umi3218/sch-core"
  url  "https://github.com/jrl-umi3218/sch-core.git", :branch => "master"
  head "https://github.com/jrl-umi3218/sch-core.git"
  version "1.1"

  depends_on "cmake" => :build
  depends_on "boost"
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
