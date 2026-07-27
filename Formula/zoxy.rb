class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.5/zoxy-0.0.5-aarch64-macos.tar.gz"
      sha256 "a2e167c1ee7702e84635ab8d0c0d265875feeeee122dcfc6435ee719a2105dc9"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.5/zoxy-0.0.5-x86_64-macos.tar.gz"
      sha256 "cbead48d28c569dfa5d4b5a161b83f193439520c6e3021f22a331a87af50fb0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.5/zoxy-0.0.5-aarch64-linux.tar.gz"
      sha256 "5720e711fa7fbcfe1edbbb3ba1aa0721c31965584440b87d440905d79fb6ce9f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.5/zoxy-0.0.5-x86_64-linux.tar.gz"
      sha256 "14ed866daa4c432ed4b608e71e6d63682417572e3809a993c6310e46e4b3f0c5"
    end
  end

  def install
    bin.install "zoxy"
  end

  test do
    output = shell_output("#{bin}/zoxy #{testpath}/missing.json 2>&1", 1)
    assert_match "cannot read config", output
  end
end
