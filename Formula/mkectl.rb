class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.1.1".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "0bc6f836c7c1672cd3f8ae8c3483ed19de6dbf292dad44e37d67265e8d278ce2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "7105379c426c7fcab60fd6fff44e6900d7fdedbf3be58a74e2b03b2ef437b42b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "ca78ffd2b4cc1d4361eacb6fcc8ea87e0e8ae30d924bc12097dd755add640c3b"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "639f8d7dbf749b666a8e7b314baa83fda3a29a862d7af5722f56e8e11f82b752"
    sha256 cellar: :any_skip_relocation, ventura:      "a4f010c1119f053e71c72e850d29203e24543fcd2962c5af41793b4cbad55b9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6b2dbb862c285927a171d7cdf1a4e9db277f3d1d2bd5446dec3d403ceef298de"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
