class MkectlAT400 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.0.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "67e8d2d14a5b1ad0e1053a0dc39a779d4e5c583792830818afb0d28e696b26c8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "f29bae9d60124e7a197c360f5af36e2186d1539d0c47bdb9f86f03cc4674ccda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "b967161377040c0906034ba09771b74e9283d6d41d56da46b89ad1d264fa6999"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c2ec5f9b3197446829a607a6cd113fcc2de0c46a73b5be605001acb957a61817"
    sha256 cellar: :any_skip_relocation, ventura: "c59676e20b3699397cbe65e1aed08b91816ad6c6939595d4db0281776c9aeb28"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee4cf886b408c5728a8482bf8026c312a6d485ae0046187da48850ffa6a94844"
  end

  depends_on "kubernetes-cli@1.31"

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
