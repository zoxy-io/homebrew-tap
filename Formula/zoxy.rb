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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.6/zoxy-0.0.6-aarch64-macos.tar.gz"
      sha256 "12298bea9b7476bd2dcd7b033cf66a3f938e7eb29b26aee1c13b35c3e614f495"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.6/zoxy-0.0.6-x86_64-macos.tar.gz"
      sha256 "89e4963444e0a21cbf67053520e869e0420d2402feec975eab2fb670d2f4aeff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.6/zoxy-0.0.6-aarch64-linux.tar.gz"
      sha256 "aba10b716572e577ac6eb5a0a0d6cecdbcbec0d68d4b2d21d932742ffb0c839c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.6/zoxy-0.0.6-x86_64-linux.tar.gz"
      sha256 "e3b94aae19428b0c146f6c6cd72c1fd7c78b67125ca5ce3dcb5ce35ed2d360f2"
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
