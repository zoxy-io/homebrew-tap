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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.1/zrk-1.2.1-aarch64-macos.tar.gz"
      sha256 "b54b5946ff80883e70577f51f2e130e67ff5c6b3016932c7dcdc0d3d1e1d2de0"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.1/zrk-1.2.1-x86_64-macos.tar.gz"
      sha256 "d350021f8dbe142b834c8a6083198fa1289afd7cdd9c5c11154c3e9bc809dd66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.1/zrk-1.2.1-aarch64-linux.tar.gz"
      sha256 "a35f64c1a9637f9c3b37ceaedaeddb04fb060c7a968695f64d04e60973cb2ec4"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.1/zrk-1.2.1-x86_64-linux.tar.gz"
      sha256 "9f0dfac5cefb0ecedb9ebeafeb6d8834a3496790f7a9b8674f2c9bb515ebbc65"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
