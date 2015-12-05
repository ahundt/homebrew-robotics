class Cppmt < Formula
  desc "Deformable Object Tracking (CMT) method for visual object tracking in C++"
  homepage "https://github.com/gnebehay/CppMT"
  url  "https://github.com/gnebehay/CppMT.git", :branch => "master"
  head "https://github.com/gnebehay/CppMT.git"
  version "1.0.6"

  depends_on "cmake" => :build
  depends_on "opencv3"

  def install
    cmake_args = std_cmake_args
    
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
