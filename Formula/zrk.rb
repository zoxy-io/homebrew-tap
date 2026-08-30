class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.1/zrk-2.4.1-aarch64-macos.tar.gz"
      sha256 "32128ca4ae94cb66bb155595d3a589917425f9c0a307744b69080edcf881a326"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.1/zrk-2.4.1-x86_64-macos.tar.gz"
      sha256 "fce91f92f3e4f8bd0235e2de9d592fad441ddb2fc1a44c2f64ff0f20f49369dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.1/zrk-2.4.1-aarch64-linux.tar.gz"
      sha256 "7468135179897a05ab4de9c2d84427369bc84f020600b93bb1f7581f33d4f3cb"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.1/zrk-2.4.1-x86_64-linux.tar.gz"
      sha256 "130459de300413427f205519a0f3d2a3cb396727bb8d386084f19b530e0e03c9"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
