class MkectlAT415 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/4.1.5/"
  VERSION = "4.1.5".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "11994a4d49937bf90828e7becce92c65aa2b58d31316050bb6f51cf4033df32b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "cb2780a9ab5d4579e4c9a04ea0a6b1e0990b3ad65b1daf61fba543a009342800"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "665e8e79925ea74cdde2f6a47ae75ab9f3871f54fa1a0d9168d114b40fe6b78f"
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
