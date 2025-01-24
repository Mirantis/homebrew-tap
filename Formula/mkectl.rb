class Mkectl < Formula
  desc ""
  homepage "https://mirantis.github.io/mke-docs/"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v4.0.1-rc.3/mkectl_darwin_x86_64.tar.gz"
    sha256 "54df9ee126f5c6e7bcf4d7bb8d98cf7fd2db11daa123d0c8e744997cecaa2959"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v4.0.1-rc.3/mkectl_darwin_arm64.tar.gz"
    sha256 "c31a6906d9da6dfaa02873c22bcc05a759a41a7902e3e734883121bd39faae49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v4.0.1-rc.3/mkectl_linux_x86_64.tar.gz"
    sha256 "8261544f42ab813d5ad7d3a0902be4e68dad9177411d0e7f28c6ad0277e699ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/v4.0.1-rc.3/mkectl_linux_arm64.zip"
    sha256 "6bf8927bf3e6e4c8e9435eaceec202651fdd7516d5dcab4ea67248f5f18e7a3e"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mkectl"
  end

  test do
      assert_match "Version: v4.0.1-rc.3", shell_output("#{bin}/mkectl version")
      assert_match "spec.version: v4.0.1-rc.3", shell_output("#{bin}/mkectl init")
  end

end