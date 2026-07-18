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
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.4/zrk-0.3.4-aarch64-macos.tar.gz"
      sha256 "c059ece011cc90bdc950e4eec0888bd8f2ee5f072c4bf027d25cfdfbd99d6e5a"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.4/zrk-0.3.4-x86_64-macos.tar.gz"
      sha256 "c15a8de93b94df9b3dbec96b9114c1edc45c8661ec320b88a5b9c83f4b2d425f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.4/zrk-0.3.4-aarch64-linux.tar.gz"
      sha256 "6030b9add9048bf9d79c9a12ff1571e82530e2e7ecfc03e26e2142fc78792016"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.4/zrk-0.3.4-x86_64-linux.tar.gz"
      sha256 "5fc579373c5252e4192a27e3c3476863589e94b23c1ac85570de2d81030d35ab"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
