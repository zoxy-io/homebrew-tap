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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.3/zrk-1.3.3-aarch64-macos.tar.gz"
      sha256 "6b8c089e6730391c7971461f5bc58d3ae5e90a129169c4c58bffd0a0026a370c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.3/zrk-1.3.3-x86_64-macos.tar.gz"
      sha256 "1929d6713e7c5ade1183893229232535243e3b14d06331bf3a59e63608373a5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.3/zrk-1.3.3-aarch64-linux.tar.gz"
      sha256 "2039cb9bd477cc04f4125d958f91ca91022e83b34080848dddbc1cfaab803f4b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.3/zrk-1.3.3-x86_64-linux.tar.gz"
      sha256 "fb09c2ea9f6c639e79303e82d3f897cef78186d44c679da21b4571dd7a99471e"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
