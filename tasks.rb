class Tasks < Formula
  desc "Tasks is library for real time control of robots and kinematic trees using constrained optimization."
  homepage "https://github.com/jrl-umi3218/Tasks"
  url  "https://github.com/jrl-umi3218/Tasks.git", :branch => "master"
  head "https://github.com/jrl-umi3218/Tasks.git"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "boost"
  depends_on "spacevecalg"
  depends_on "rbdyn"
  depends_on "sch-core"
  depends_on "eigen-qld"
  depends_on "eigen3topython" => :recommended
  

  def install
    cmake_args = std_cmake_args + %W[
      -DBoost_DIR=#{Formula["boost"].opt_prefix}
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
