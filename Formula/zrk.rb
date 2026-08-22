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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.0.0/zrk-2.0.0-aarch64-macos.tar.gz"
      sha256 "e55741e4cf9a6bd20a5cc34601c3b593f52c90d86210238464f00c08a2efe692"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.0.0/zrk-2.0.0-x86_64-macos.tar.gz"
      sha256 "f49ceb513f75250dddfa9d936d45aeb966709e512ffb8a60f4a3c6c2e2d77945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.0.0/zrk-2.0.0-aarch64-linux.tar.gz"
      sha256 "517afdd3dc7e49c3a70ea711edd002792149abcad554814e588b879b59c2123f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.0.0/zrk-2.0.0-x86_64-linux.tar.gz"
      sha256 "8dbe0cc921baf6de82cae2bf407aca5cfe71c88e5627afdcb0b022c969f23352"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
