class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "v4.0.1-rc.4".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_linux_arm64.zip"
    sha256 "72df11d51a0d58053c4554ac0aef2c0ec6380dc7caa2a9897e607c03a86d92c7"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mkectl"
  end

  test do
    assert_match "Version: #{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
