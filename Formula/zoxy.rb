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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.0/zoxy-0.2.0-aarch64-macos.tar.gz"
      sha256 "9221c536d81438909986f79bde492ecda9165ef9645e89641ea003a243fed48b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.0/zoxy-0.2.0-aarch64-linux.tar.gz"
      sha256 "25b74fcb6ae6cf2ea11e0a8f071e044f5ce6daeb7fbbeb6bf7e3eda42cd4e91f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.0/zoxy-0.2.0-x86_64-linux.tar.gz"
      sha256 "216782dc1d440710d818ca0e7792f5e89a6dbf470614996df0b3115bf7e8399b"
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
