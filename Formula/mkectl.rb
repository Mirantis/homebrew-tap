class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.1.3".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "23f96e35e02906169036e04a793e8c8d59f83ff917a06161178e92ba2ded8173"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "b385ce552d697b61dd9738f4510d54c6a1d1f7d6a8ac62d59882086b734cf749"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "685e2e4ad3a38d423c83a2bf467eebfced6b5f5c86d2b5ccc63036a6f5cc7a25"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c46e5781da23e5684482dd6d0b583adb8046b668ee09cfafbd61ab6b23f54a9e"
    sha256 cellar: :any_skip_relocation, ventura:      "57b925bf2f3569b7a4411a8fc1070dc51270ce94f668556fc2039bc9ea12619c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d9962f247748a4d876852c4e6d5d3aaaef78cffee2c64c58aa5f3d4c8f362d3"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
