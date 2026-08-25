class Zurl < Formula
  desc "Zero-allocation std.Io-native HTTP/1.1 client for Zig"
  homepage "https://github.com/zoxy-io/zurl"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zurl"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.0/zurl-0.0.0-aarch64-macos.tar.gz"
      sha256 "79cba8849ac60708f8af5fe584d286810705779fae8c0a233be7e7bc18a9b876"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.0/zurl-0.0.0-x86_64-macos.tar.gz"
      sha256 "1475f7496353e91a819fa655c2d2b06ce4618a749b45e83c1e60ca8fbc9b39a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.0/zurl-0.0.0-aarch64-linux.tar.gz"
      sha256 "7db9fc99f1773d821bcab69274a7330e66d6c24e5fbc963967c7a39697c49bdb"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.0/zurl-0.0.0-x86_64-linux.tar.gz"
      sha256 "12eefa0565d0c18c3881c99fb593d1d831ebde6457ae8d609e076147ddac92bd"
    end
  end

  def install
    bin.install "zurl"
  end

  test do
    output = shell_output("#{bin}/zurl 2>&1", 1)
    assert_match "usage: zurl", output
  end
end
