class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "4.1.2".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "8e5cb7f0cbf9ddbdec2362416c526d2e7d823816ad3a663128ece2be392dda82"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "c9920298046a44a2faae82e9627a46da12a1b0b606c59e66340f9a8a3aa01d91"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "123d28fe19333948605ca76281d05ceeb1a30bae2755730085d4faf70b396a67"
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
