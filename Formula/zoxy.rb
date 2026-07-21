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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.3/zoxy-0.0.3-aarch64-macos.tar.gz"
      sha256 "52c8a14e454c82ddb86a6cf4c344f318b9154377a13c0077f7e98828364163f6"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.3/zoxy-0.0.3-x86_64-macos.tar.gz"
      sha256 "5444d08cd7f73bfb6d44fb777cbb3f5b1d5a918662da240fab55715c69625a1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.3/zoxy-0.0.3-aarch64-linux.tar.gz"
      sha256 "2c90ef34473fe746dafb9707ff44b2fe3f1e4872bd63e649265cb8d815e2d726"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.3/zoxy-0.0.3-x86_64-linux.tar.gz"
      sha256 "fd12c066ebaeddbd2485c14f8921bff1b172f90e65ebb19b2f9b9c98e1745e00"
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
