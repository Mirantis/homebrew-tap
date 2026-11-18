class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.2.1".freeze

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "a423f1a66c579cc7369460448fe5abd90c2cbcee38e64558d391ebc96a97d758"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "da845b4cc75d84e375ca91af676011b8c81d5ab572c4e39be34b35d1efe2c99c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "db95382a799ab0ee6e02517425f4c1b21f42fa0cc1681d124c0d010f48698d8c"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-4.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f36465be2031409a5c8d495cb7b6db7bd303166e6c7d1f1e55d10e718ed3611c"
    sha256 cellar: :any_skip_relocation, sequoia:      "b3843d1a60280d1163d4ba266a09afd51d7f3914820f8ce2fc5498d6d058df29"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
