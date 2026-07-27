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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.0/zrk-1.3.0-aarch64-macos.tar.gz"
      sha256 "0cb69ff9c6f6c1c8995dd6d286e58f355db1a835951567b0620b6da781bdb3c9"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.0/zrk-1.3.0-x86_64-macos.tar.gz"
      sha256 "9e2af5c85b18f382a75838b9f20676c32963f03a8351108ea884ab71feab33f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.0/zrk-1.3.0-aarch64-linux.tar.gz"
      sha256 "9921f9b3db5cf6073b6851dafa1ef1819a9022e7f64b3012b161c7375ee294af"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.0/zrk-1.3.0-x86_64-linux.tar.gz"
      sha256 "9e795206920bb322f87c2ed9e7fbe8253344827cecb3e6f5d917075c30dc46d9"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
