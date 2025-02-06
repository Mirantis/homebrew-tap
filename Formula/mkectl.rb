class Mkectl < Formula
  desc "Tool for creating and managing MKE 4.x kubernetes clusters"
  homepage "https://mirantis.github.io/mke-docs/"
  VERSION = "v4.0.0".freeze

  version VERSION

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_x86_64.tar.gz"
    sha256 "67e8d2d14a5b1ad0e1053a0dc39a779d4e5c583792830818afb0d28e696b26c8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_darwin_arm64.tar.gz"
    sha256 "f29bae9d60124e7a197c360f5af36e2186d1539d0c47bdb9f86f03cc4674ccda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MirantisContainers/mke-release/releases/download/#{VERSION}/mkectl_linux_x86_64.tar.gz"
    sha256 "b967161377040c0906034ba09771b74e9283d6d41d56da46b89ad1d264fa6999"
  else
    odie "Unsupported platform"
  end

  bottle do
    root_url "https://github.com/Mirantis/homebrew-tap/releases/download/mkectl-v4.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4c2bbb38d340be53a39a2d5bc7c137eb65d5d93bf871f85b91817cd3ca223bda"
    sha256 cellar: :any_skip_relocation, ventura:      "a11c056d1c74e3cab831c8ea89c1a7be3f2cc177aeafafb1b76f5a870b8d4e51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2818dabfa3c380729a87ddd91cf4d19e462a0d9bf3478c5759d25b2654f0a626"
  end

  depends_on "k0sproject/tap/k0sctl"
  depends_on "kubernetes-cli@1.31"

  K0SCTL_COMMIT = "247279090669681e6bee89c3b270e0893ca50c58".freeze

  def install
    tap_dir = Utils.safe_popen_read("brew", "--repo", "k0sproject/tap").strip
    odie "k0sproject/tap is not tapped" unless File.directory?(tap_dir)

    system "git", "-C", tap_dir, "fetch", "--all"
    system "git", "-C", tap_dir, "checkout", K0SCTL_COMMIT

    current_commit = Utils.safe_popen_read("git", "-C", tap_dir, "rev-parse", "HEAD").strip
    odie "Expected commit #{K0SCTL_COMMIT}, but got #{current_commit}" unless current_commit == K0SCTL_COMMIT

    bin.install "mkectl"
  end

  test do
    assert_match "Version: #{VERSION}", shell_output("#{bin}/mkectl version")
  end
end
