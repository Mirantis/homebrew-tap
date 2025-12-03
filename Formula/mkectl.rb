class Mkectl < Formula
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
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c46e5781da23e5684482dd6d0b583adb8046b668ee09cfafbd61ab6b23f54a9e"
    sha256 cellar: :any_skip_relocation, ventura:      "57b925bf2f3569b7a4411a8fc1070dc51270ce94f668556fc2039bc9ea12619c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d9962f247748a4d876852c4e6d5d3aaaef78cffee2c64c58aa5f3d4c8f362d3"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
