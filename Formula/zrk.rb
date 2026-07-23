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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.2/zrk-1.0.2-aarch64-macos.tar.gz"
      sha256 "9538b8c6e08348d3d4cf2144339ef66d620723294236f7f6d74fe2c60b59073b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.2/zrk-1.0.2-x86_64-macos.tar.gz"
      sha256 "0d3ace7139467ed4be26723ae9eedb21a999c492e47dc8840e3de937fd51d5c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.2/zrk-1.0.2-aarch64-linux.tar.gz"
      sha256 "3414a702a7a386ef21ffc39dfe2c6a04ecf6552626dd513462e87fa1d83dfc63"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.2/zrk-1.0.2-x86_64-linux.tar.gz"
      sha256 "e8ac9e55b983797605f2caabb5e344c6af790a2ecbc9fbdb0567e4f0b41851fb"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
