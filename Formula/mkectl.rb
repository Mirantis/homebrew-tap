class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.2.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "e36b668e56875ea4b2288c37979fdb26488480d67c003a25d70e4463f9bd3bbe"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "95e3fcaa65673912e316e3022d9e442631aaba8bca3373c99c28b089d65c597a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "ab8cfb2d321e6505c042cb42fd27a7f44a8a34d882384b9f82220b0eb9af1993"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "32d052ba026cb734a0b9cba0d0934f3696a47bf41daf11d36c1615fca24c6f1b"
    sha256 cellar: :any_skip_relocation, sequoia:      "4395d8cefda5b9d9953c2a332e4781c79a217074b0f12cfba752d919a52a8c4b"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
