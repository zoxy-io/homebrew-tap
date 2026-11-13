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
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.1/zrk-3.0.1-aarch64-macos.tar.gz"
      sha256 "7524948ca92804e3c6df6d53282b9b787db57141b4c14b5a600a5ccdb545124b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.1/zrk-3.0.1-x86_64-macos.tar.gz"
      sha256 "a795372dd86cfcd00795d9231322f9c4217d0608071df08743726c12ad61470b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.1/zrk-3.0.1-aarch64-linux.tar.gz"
      sha256 "4c405a3834b1772c907b7912477caa035eb4f037dc13ab0c1900bb72c6cafd69"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.1/zrk-3.0.1-x86_64-linux.tar.gz"
      sha256 "e7a06ab95c90c42c1c7d15400bd9767d628efdd0bbfdae57bdc02f80c59665f7"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
