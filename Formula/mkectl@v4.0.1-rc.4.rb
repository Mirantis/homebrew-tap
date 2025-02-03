class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "v4.0.1-rc.4".freeze

  version VERSION

  depends_on "k0sproject/tap/k0sctl"
  depends_on "kubernetes-cli"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "4ea965cc0b522508261d92270c305d2d5f6eb6fe09678a43be130a6b904f6a3d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "7a90e30a56c63e6c5547f14890273d4ec82f47d4fdc4c35a59898a9ed9dfc470"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-#{VERSION}"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4ea965cc0b522508261d92270c305d2d5f6eb6fe09678a43be130a6b904f6a3d"
    sha256 cellar: :any_skip_relocation, ventura: "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7a90e30a56c63e6c5547f14890273d4ec82f47d4fdc4c35a59898a9ed9dfc470"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: #{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
