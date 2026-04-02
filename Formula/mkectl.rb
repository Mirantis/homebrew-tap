class Mkectl < Formula
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "206551bf8743d62b9edcbd6f3a65ecc6f9c4f7aa944c1040e7ca54cfec8c96c4"
    sha256 cellar: :any_skip_relocation, sequoia:      "6e983c9384273f529cc72cbc96e9acf4f64f0f287b29f093f1e77a9eeb2bd827"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0817e0ea7b5232ee7e28807dc8a4d46a93286f0b514f80433299217b1ea8784a"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
