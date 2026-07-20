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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.0/zoxy-0.0.0-aarch64-macos.tar.gz"
      sha256 "b1602cb92304d46962a091dfb74ed65eee69bb9b0645ea9492f04b1729d9ec85"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.0/zoxy-0.0.0-x86_64-macos.tar.gz"
      sha256 "b162afe0bbd61c07eb4d91d464cc0dac7378b2afcf609e38a37dc941824f65ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.0/zoxy-0.0.0-aarch64-linux.tar.gz"
      sha256 "7fa448a4117a7c56d140bdd16bca9fbdcd95c0a4ee89d74460e7369dda62ea7b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.0/zoxy-0.0.0-x86_64-linux.tar.gz"
      sha256 "4985e29ee17ee9c66559224ed65a0cb839ec1b0198f21c70e056a12e662074f9"
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
