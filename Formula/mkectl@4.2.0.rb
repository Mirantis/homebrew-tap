class MkectlAT420 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.2.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "e36b668e56875ea4b2288c37979fdb26488480d67c003a25d70e4463f9bd3bbe"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "95e3fcaa65673912e316e3022d9e442631aaba8bca3373c99c28b089d65c597a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "ab8cfb2d321e6505c042cb42fd27a7f44a8a34d882384b9f82220b0eb9af1993"
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
