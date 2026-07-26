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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.4/zoxy-0.0.4-aarch64-macos.tar.gz"
      sha256 "9652537379f6554997fd427888ec5e0b28c4d08a16e04f07c55456d84306bdc2"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.4/zoxy-0.0.4-x86_64-macos.tar.gz"
      sha256 "6a50c760b0e65ee6912dd9ffeb815a8bd749f8529564d22cdee624a3b1a00629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.4/zoxy-0.0.4-aarch64-linux.tar.gz"
      sha256 "178aed6a4d0ac85cd8f906e23d11fe53f4ae40c2d96c5763ba2984fff06605b6"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.4/zoxy-0.0.4-x86_64-linux.tar.gz"
      sha256 "bcad53aaf1fa873e0360de4268739171a899d8c427abc68e6c2c78905c77c929"
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
