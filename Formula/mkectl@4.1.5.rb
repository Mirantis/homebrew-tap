class MkectlAT415 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/4.1.5/"
  VERSION = "4.1.5".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "11994a4d49937bf90828e7becce92c65aa2b58d31316050bb6f51cf4033df32b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "cb2780a9ab5d4579e4c9a04ea0a6b1e0990b3ad65b1daf61fba543a009342800"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "665e8e79925ea74cdde2f6a47ae75ab9f3871f54fa1a0d9168d114b40fe6b78f"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl@4.1.5-4.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0c36598312c56c55d4fcb881716aad2cc5449150ff19bf99c75499375e70147"
    sha256 cellar: :any_skip_relocation, sequoia:      "1881dba7dd3f5591e51aa097b96ae15b192cb6cdd4285349d06a985bde50965c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23459633fa3aeb1eeeb3572cd954f2bf7cf9347031408d7caef0cdd65bc00210"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
