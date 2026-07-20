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
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-0.4.1-aarch64-macos.tar.gz"
      sha256 "83ade4d194da0e9e9d132e4043eddff47c361520c232ac23c7d505034e2db1ef"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-0.4.1-x86_64-macos.tar.gz"
      sha256 "e23021d11d802c0e4807701b1411bc31ec7d09afe6b5ae6f1c48e13fd1e22279"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-0.4.1-aarch64-linux.tar.gz"
      sha256 "5ea5c3e5947aa3f0e34a69ed2cc070b016edcfb9bc57cb5b04a106b08290f11b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-0.4.1-x86_64-linux.tar.gz"
      sha256 "1d5ee1512227e04cf8b760b48c5bc4b78a0498a4afd3c878c94155379f161a1b"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
