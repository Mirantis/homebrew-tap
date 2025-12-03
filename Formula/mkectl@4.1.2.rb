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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl@4.1.2-4.1.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0fdf470a9b350cedbc108f5c1c983a0f526d38832e2b9a20e11b809d1e8a9c5"
    sha256 cellar: :any_skip_relocation, ventura:      "b629218e2ebe26d379a235de83b1f6283d4f784a59373ef7e844d4c4feea8b53"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "33e236cb1dce9a32090ac522e67237710cbd4360a8bb4f316c3368a6195f1f7d"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
