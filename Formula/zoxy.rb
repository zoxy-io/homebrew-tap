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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.9/zoxy-0.0.9-aarch64-macos.tar.gz"
      sha256 "3ae0410f1a353a121e6da0ca3dde722093abc50daa06f22632a26a176d378a94"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.9/zoxy-0.0.9-x86_64-macos.tar.gz"
      sha256 "f3950bfbbd5ec0fce10cb76befb8332e5a5d95f79591bc3b6b779e8c7231392b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.9/zoxy-0.0.9-aarch64-linux.tar.gz"
      sha256 "957759eb7fd3a27467561f887dda81bc48163c69bcca6cf5ad85c78207ed8154"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.9/zoxy-0.0.9-x86_64-linux.tar.gz"
      sha256 "841e5073f212b57a69c1b0cbf8262c633840d185f2cf5435774d27e84caee5fb"
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
