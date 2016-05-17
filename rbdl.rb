class Rbdl < Formula
  desc "RBDL - Rigid Body Dynamics Library"
  homepage "https://bitbucket.org/rbdl/rbdl"
  url  "https://bitbucket.org/rbdl/rbdl", :using => :hg, :branch => "default"
  head "https://bitbucket.org/rbdl/rbdl"
  version "2.2.0"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "unittest-cpp"  => :recommended

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
