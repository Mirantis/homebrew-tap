class MkectlAT401-rc4 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.0.1-rc.4".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "4ea965cc0b522508261d92270c305d2d5f6eb6fe09678a43be130a6b904f6a3d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "7a90e30a56c63e6c5547f14890273d4ec82f47d4fdc4c35a59898a9ed9dfc470"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "43ee3dfde5217611bd65b058548f3d1330eb5a44ce24c76fecf5eb3417eea4fd"
    sha256 cellar: :any_skip_relocation, ventura:      "93e057106ef631179ef213c7f5f28dbd7a54ae0f213f030c39cd9456b9674c63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9ec191a312a9e6a6a9459da9df7434339e1a8e8f68023a436cb980e6be62823"
  end

  depends_on "kubernetes-cli@1.31"

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
