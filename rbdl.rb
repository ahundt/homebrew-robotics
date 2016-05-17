class Rbdl < Formula
  desc "RBDL - Rigid Body Dynamics Library"
  homepage "https://bitbucket.org/rbdl/rbdl"
  url  "https://bitbucket.org/rbdl/rbdl", :branch => "default"
  head "https://bitbucket.org/rbdl/rbdl"
  version "2.2.0"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "unittest-cpp"  => :recommended

  def install
    cmake_args = std_cmake_args

    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
