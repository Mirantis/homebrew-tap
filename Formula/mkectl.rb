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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "097da275470c18fa913e5c8e22297bb9d92b26990143342efd49872850743767"
    sha256 cellar: :any_skip_relocation, sequoia:      "da9bd0c5eafb7df3e61a8f95bfb375faf0b16a0cdf3caaae66723299d067b056"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6c9d3d75d6f8e0b344eb36f1cc17be7cdee967626b56c59bfa531f37bb7d09d"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
