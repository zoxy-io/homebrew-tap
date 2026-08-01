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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.8/zoxy-0.0.8-aarch64-macos.tar.gz"
      sha256 "35805f602ff6e4b2bf6715c580036d70f1b49c60d216e234b445884a2318079c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.8/zoxy-0.0.8-x86_64-macos.tar.gz"
      sha256 "dbddbf4a232e484c123d8cae7c2ec0ade74708e95df4f9a8b340c550ecf9e804"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.8/zoxy-0.0.8-aarch64-linux.tar.gz"
      sha256 "989b1184575614505411b0f28496e1336749b911a6e41bff1c29ac6e7b340c1e"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.8/zoxy-0.0.8-x86_64-linux.tar.gz"
      sha256 "5a7795267cd6d2e9592bbb29e5387f8a10fff82b03c17e915282b2ca9734c1f6"
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
