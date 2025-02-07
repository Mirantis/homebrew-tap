class MkectlAT400 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.0.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4c2bbb38d340be53a39a2d5bc7c137eb65d5d93bf871f85b91817cd3ca223bda"
    sha256 cellar: :any_skip_relocation, ventura:      "a11c056d1c74e3cab831c8ea89c1a7be3f2cc177aeafafb1b76f5a870b8d4e51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2818dabfa3c380729a87ddd91cf4d19e462a0d9bf3478c5759d25b2654f0a626"
  end

  depends_on "kubernetes-cli@1.31"

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
