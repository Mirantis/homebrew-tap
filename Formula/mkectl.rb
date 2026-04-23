class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a1694ae3702595a0610836a633d2f3c978791441d3c81c73bf3418ed27eb64c7"
    sha256 cellar: :any_skip_relocation, sequoia:      "00a8c57a0bf518a887d968caf0e98a06e81874d74fe826d6a0183875b72ce539"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d5f6d1960ecd4b8a8b617377ea30358a21b2ca33fc47076f0795863e122d74fc"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
