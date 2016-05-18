class UrModernDriver < Formula
  desc "Driver for the UR3/UR5/UR10 robot arms from universal robots"
  homepage "https://github.com/ThomasTimm/ur_modern_driver/"
  url  "https://github.com/ahundt/ur_modern_driver.git", :branch => "master"
  head "https://github.com/ahundt/ur_modern_driver.git"
  version "0.01"

  depends_on "cmake" => :build
  depends_on "boost"

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
