class MkectlAT414 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.1.4".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "a3dfc012bc545686fbec7be9ee424662801fed328bf226ff6d96336a437f258d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "969d955b3c04339db5556ca89f8b355c25557bd585a7bc014885585b43d2198e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "f25484ab01e52ffaad0fa4d21f04e90e57c80c2dce1508d6624313bdb916b125"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.3"
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
