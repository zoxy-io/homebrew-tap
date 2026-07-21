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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.2/zoxy-0.0.2-aarch64-macos.tar.gz"
      sha256 "0c0e3ce1c899c4a72b75dc6eceec0426524d71fa7955351b91dc03679e5263da"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.2/zoxy-0.0.2-x86_64-macos.tar.gz"
      sha256 "2f5a2baf1ad75e124e8193a39efbfd2483f22510abde0427f673b5fdf6c2ce3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.2/zoxy-0.0.2-aarch64-linux.tar.gz"
      sha256 "4f275d8c576ab1f65f8536e78e176d55d5e790957773483ecbfad4cacb8853ba"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.2/zoxy-0.0.2-x86_64-linux.tar.gz"
      sha256 "5b58aaf68b9407231f65f3232f38ac0350f937cd6624de545b7c4ab6ab70873c"
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
