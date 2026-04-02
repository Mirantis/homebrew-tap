class MkectlAT414 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/4.1.4/"
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl@4.1.4-4.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e084701b868bb290f9d635d0464a6ab552a87a76ecefc6272174ed8c38081967"
    sha256 cellar: :any_skip_relocation, sequoia:      "d294dbbd0d06638339f02f18d7418336d24d3e477b2bdfc86b9a4c72c5152c57"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "029fa4c389f76dcbfc2493e7f77568657ea71507f617ed8108f6eac0d26929ec"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
