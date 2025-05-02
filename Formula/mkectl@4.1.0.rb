class MkectlAT410 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.1.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "7b9d54b30c2f6ae590802135aa9558c7293ba40bc107434c9118e1636e4cec65"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "78777e78133f6a36671022456d429068570ff3a687f7f0500763010c2ed818ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "8816a0e91b5d9385c62729571c2479edcd670967d9e55b752324c77f7866d714"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-#{VERSION}"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "43ee3dfde5217611bd65b058548f3d1330eb5a44ce24c76fecf5eb3417eea4fd"
    sha256 cellar: :any_skip_relocation, ventura:      "93e057106ef631179ef213c7f5f28dbd7a54ae0f213f030c39cd9456b9674c63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9ec191a312a9e6a6a9459da9df7434339e1a8e8f68023a436cb980e6be62823"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
