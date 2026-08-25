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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.2/zrk-2.2.2-aarch64-macos.tar.gz"
      sha256 "e99e453bc4d15a843c28cb3f97b6e779289f1e6d95e8016e428e2bc6e80f2abf"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.2/zrk-2.2.2-x86_64-macos.tar.gz"
      sha256 "c45ec79fa575efc6a4687ad25ea46bf74d6293744f204f7868a30fd746d353c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.2/zrk-2.2.2-aarch64-linux.tar.gz"
      sha256 "42e4cd6eef9c27431e9ed25f39c6c025963b8cee790b1d59c81531023dcc7bde"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.2/zrk-2.2.2-x86_64-linux.tar.gz"
      sha256 "51cae01069974c7110e951c0d9c806925a76c8067ac3153eb4be96d738e71c05"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
