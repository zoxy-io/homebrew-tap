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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.0/zoxy-1.0.0-aarch64-macos.tar.gz"
      sha256 "b24cce093356dd42e4b8ede57ff9b0d5ba23156497753c4b7d57013bf9feda86"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.0/zoxy-1.0.0-x86_64-macos.tar.gz"
      sha256 "1d3ce1c4cbba83e2ae936d27d248017e05633b1f8b14538db4ea9a6d2b0b8706"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.0/zoxy-1.0.0-aarch64-linux.tar.gz"
      sha256 "7fa0963125d4333c1210f9e256d29f033da0df46354565399cb5dab32ac3d0b7"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.0/zoxy-1.0.0-x86_64-linux.tar.gz"
      sha256 "2e75b5453bfd44dd66a1bd48ec5cfcb30ddf6789bc38fcb005588c982e109921"
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
