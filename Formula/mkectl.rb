class Mkectl < Formula
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5e18db3f40a2a51e71de78673caa196c14511e3a156c7bddf27d65eca284197e"
    sha256 cellar: :any_skip_relocation, ventura:      "17418cbe45a6bcfb1db4644ac6046776ed431b13d00c15468745ae7d42c181d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "84421f34ec1482468fad26d1639d153bdf2b8e2026e6dd623cd018a33b6b1edd"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
