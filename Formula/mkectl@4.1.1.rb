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
