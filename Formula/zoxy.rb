class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  # Apple Silicon only. There is no Intel macOS bottle from
  # 0.2.0 on: building one needs an Intel macOS runner, and
  # GitHub's is retired. Homebrew on an Intel Mac will report
  # that no bottle is available rather than download one that
  # cannot run, which is the failure worth having.
  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.7.0/zoxy-0.7.0-aarch64-macos.tar.gz"
      sha256 "6434640ba79e1b20921c637919e0c117f72c85554e6d7339658ceea8a030f143"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.7.0/zoxy-0.7.0-x86_64-macos.tar.gz"
      sha256 "fbbc53b763afcbc0d87dd615e92ed1424f4457d69c09a9a738b86051df5ee8b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.7.0/zoxy-0.7.0-aarch64-linux.tar.gz"
      sha256 "487d7e4ad07e914d39b7e3505cda07ecac27fb918bac51fe1bc24bce3bb70307"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.7.0/zoxy-0.7.0-x86_64-linux.tar.gz"
      sha256 "24ee20d2ffd29494ab046e968cf9852185b769296d4bd4eeef6c0d8a4b385db1"
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
