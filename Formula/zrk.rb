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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.1/zrk-2.2.1-aarch64-macos.tar.gz"
      sha256 "acd13e5dcf3305fdf8d29a5fdc5046e8413cce9db098ffc381f6b8988fb5024c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.1/zrk-2.2.1-x86_64-macos.tar.gz"
      sha256 "67e22cb87fdf0fb1eb2bf5ff98d5a34c6af5585113cfc7e99f73e17bf8e94b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.1/zrk-2.2.1-aarch64-linux.tar.gz"
      sha256 "3064e2fbe4cebcdcc8dd2cc4e69ab8ee41c91eb32eb67d78584e9d35569366cc"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.1/zrk-2.2.1-x86_64-linux.tar.gz"
      sha256 "9795b1b95c5c9bda862a6803d6e5fe311a212c2d5aba973b88f0e95791bb0e45"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
