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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.3.0/zrk-2.3.0-aarch64-macos.tar.gz"
      sha256 "2319c46c8be6d2d60ad33ef6f448e00f911db63b8d1e76d06eb9d507d625067c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.3.0/zrk-2.3.0-x86_64-macos.tar.gz"
      sha256 "d13cc1ca5264a2ca57cdccd259441b53f6290090d7fdae98b66766c882647b90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.3.0/zrk-2.3.0-aarch64-linux.tar.gz"
      sha256 "361f2632e3cee672cf6a8676438c9fa93e8a5702a0007bacc266861767bab213"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.3.0/zrk-2.3.0-x86_64-linux.tar.gz"
      sha256 "ab6f1c1ce34ce73f52afd106419d15e5c494bd1cedd475afa56babb85b09a816"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
