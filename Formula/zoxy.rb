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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.1/zoxy-0.0.1-aarch64-macos.tar.gz"
      sha256 "2faf21ee0aead6f4d32f97f7935654f5018429be137ede90363b624b1dc12841"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.1/zoxy-0.0.1-x86_64-macos.tar.gz"
      sha256 "3aaf9a5e70ceb49fb5447f0030e4fd9afc431dfa58a93fa47bdf3454a10a44d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.1/zoxy-0.0.1-aarch64-linux.tar.gz"
      sha256 "6fefd93fa71143b770fddc702f543c84019dfe1ee729d68e849363b92bd8a07b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.1/zoxy-0.0.1-x86_64-linux.tar.gz"
      sha256 "4ea5de3c123096d88405fb6363dad72ddf9feb16e6eb53c0a80b1909eeabd2c2"
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
