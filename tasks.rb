class Tasks < Formula
  desc "Model Rigid Body Dynamics Algorithms"
  homepage "https://github.com/jorisv/Tasks"
  url  "https://github.com/jorisv/Tasks.git", :branch => "master"
  head "https://github.com/jorisv/Tasks.git"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "boost"
  depends_on "spacevecalg"
  depends_on "eigen3topython" => :recommended
  

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
