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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.1/zrk-1.4.1-aarch64-macos.tar.gz"
      sha256 "19124f9edaa7617a0b75a94932983b96de5de3bc77d9c0d0c87ac8486b6f8f3d"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.1/zrk-1.4.1-x86_64-macos.tar.gz"
      sha256 "72f92d3e5181e028e62c537fe8a84d6b799f3d678c25ede7d1aa0dec20e8679f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.1/zrk-1.4.1-aarch64-linux.tar.gz"
      sha256 "bc0f34ae13749d0a1062de1d8c9034e001f91f31911264a6cdd5dea68b302c7e"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.1/zrk-1.4.1-x86_64-linux.tar.gz"
      sha256 "b20ae7020aae9eec8d79945dcfbb234b922e85db78ac73dafd5edf3d38b4e335"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
