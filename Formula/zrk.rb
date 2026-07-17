class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/floatdrop/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.2/zrk-0.3.2-aarch64-macos.tar.gz"
      sha256 "0bca781b95bc14527f8260bc84e8ef744ee3b137f784f1e00d2ad25333dd5e7c"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.2/zrk-0.3.2-x86_64-macos.tar.gz"
      sha256 "33ad12ef04943aa0ad49cc853793878d664fe199cbf6e51d01912f701734e1fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.2/zrk-0.3.2-aarch64-linux.tar.gz"
      sha256 "437b5de8c6e15c92805437ec87ef228ebade6526312f868b15f89655ea23d495"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.2/zrk-0.3.2-x86_64-linux.tar.gz"
      sha256 "884f96b11eed642ea783bf07a1bc5013b31f8e7fd917de5bbdabe2682d5618b4"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
