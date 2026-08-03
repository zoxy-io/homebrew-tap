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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.1.0/zoxy-0.1.0-aarch64-macos.tar.gz"
      sha256 "3f41d81b89915a34fc2fd5c5ebbda7c59c1349cc6086a9fe78f96ac04340b037"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.1.0/zoxy-0.1.0-x86_64-macos.tar.gz"
      sha256 "5246f626be30ac2b1ababa141bda35eb0eb3bc799672c7f1b546a564028b5809"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.1.0/zoxy-0.1.0-aarch64-linux.tar.gz"
      sha256 "d3fcd02eab7924507185d1cafa9f900eeff1bbf6b5510767701d16ef7580dfc5"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.1.0/zoxy-0.1.0-x86_64-linux.tar.gz"
      sha256 "46d5537597b94d528e117576c61ea80acc9863aa7b60a5463c08a14a28fa8636"
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
