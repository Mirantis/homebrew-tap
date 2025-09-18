class MkectlAT411 < Formula
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl@4.1.1-4.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ec5252cc884af40d5b241833a8e733f42c294065d74be072f585f035200dd5c1"
    sha256 cellar: :any_skip_relocation, ventura:      "2608cf7875c9c52f345934ebacbd5e17af60fd2d4d91090e31cb78b4401a7d75"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f0262c9a6f09a0290d74542361368efea20cb8115018b577d09ecf5fa7c6039"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
