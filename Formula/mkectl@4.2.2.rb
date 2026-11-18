class MkectlAT422 < Formula
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
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl@4.2.2-4.2.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "12f6e620b3e15044758d969149feeca111d840d9c12203ecebfcf9cbb1a24583"
    sha256 cellar: :any_skip_relocation, sequoia:       "568d8ce34dbff6aff25266be5217d2c40cc1071fd43d54e248c1dab576bd5c65"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "34284e45923f5787656f60f567d62bfd0775cc39258811d4ca35b0c444ca6c4d"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: v#{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
