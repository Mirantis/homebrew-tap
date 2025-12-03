class MkectlAT412 < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.1.2".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "47ced52a44361024cdb3764d946b3e18c3e18487a76ddc03f97032392979cef6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "a9c6533f37720b03c63ec8202684d93362ad1c878df5e17aa54aba3de55552eb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "ba197889a044d8f8c23426b8b6b22df508ac064c35509f7fb9e49d90a784afe5"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "03867bcf705384b927f95de1901570086760f8bee176fbe806477da8389170aa"
    sha256 cellar: :any_skip_relocation, ventura:      "8c139e9e04b2149ec30c695c4c2766f9896878e41f8a89f226d1bd5a676a2b56"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cccfb32a75ff029a4860b6d96a16e6cc81ced9fba4a4c2d0d29736e9b400c749"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
