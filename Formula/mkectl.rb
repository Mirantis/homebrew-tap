class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://docs.mirantis.com/mke4k/latest/"
  VERSION = "4.2.2".freeze

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "00d0dfd97cb0a42dc9d062989845d3c1aef277fbbbf108a491d4026fdc751285"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "9999b4dc5dd42a1718e098a5ee36510f32fe58777b6ad035c9d3bac437b01ee7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "54dedde990b30cfe982cdd12f3ad903098a3de879101f1303e151c52a76e601c"
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
