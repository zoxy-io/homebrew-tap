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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.2/zrk-2.4.2-aarch64-macos.tar.gz"
      sha256 "3ea28cee28401c543bdc33eaf891060f5f9e0725032da631870f67fbe4ce5389"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.2/zrk-2.4.2-x86_64-macos.tar.gz"
      sha256 "e478da1833c27281cb895506f17aff54611464874bb5291cb0755fbfce8b90b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.2/zrk-2.4.2-aarch64-linux.tar.gz"
      sha256 "18e70cf7d73061454d93cd91d6f7c3d0176fcf635a989da2d682e59f43b25914"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.2/zrk-2.4.2-x86_64-linux.tar.gz"
      sha256 "71c0c918f2c33bfc01e3b93cec993ef843e8eaf1e5fe18c06cb5e25288f4bafd"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
