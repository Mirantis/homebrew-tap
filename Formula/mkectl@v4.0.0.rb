class Mkectl@v400 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "v4.0.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "67e8d2d14a5b1ad0e1053a0dc39a779d4e5c583792830818afb0d28e696b26c8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "f29bae9d60124e7a197c360f5af36e2186d1539d0c47bdb9f86f03cc4674ccda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "b967161377040c0906034ba09771b74e9283d6d41d56da46b89ad1d264fa6999"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-#{VERSION}"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f29bae9d60124e7a197c360f5af36e2186d1539d0c47bdb9f86f03cc4674ccda"
    sha256 cellar: :any_skip_relocation, ventura:      "67e8d2d14a5b1ad0e1053a0dc39a779d4e5c583792830818afb0d28e696b26c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b967161377040c0906034ba09771b74e9283d6d41d56da46b89ad1d264fa6999"
  end

  depends_on "k0sproject/tap/k0sctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: #{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
