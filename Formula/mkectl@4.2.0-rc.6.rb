class MkectlAT420-rc6 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.2.0-rc.6".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "93cb8bbb8a636fa690965765181bcf1c4b190f391bb5201f6c08034972283860"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "6f80fe54bf4a35997566d06370d060b4fcd4c2e9876a440c20f202a5a281384a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "f88ec332f95f02e3829a528a3aaff899cfabbcd82220421fa54c9b1ff91352a2"
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
