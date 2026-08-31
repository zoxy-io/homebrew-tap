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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.0/zoxy-0.8.0-aarch64-macos.tar.gz"
      sha256 "35515d68c56b4747b6c9f5f71c19e04537e36fe8269bafb0802de7fa776ca4b1"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.0/zoxy-0.8.0-x86_64-macos.tar.gz"
      sha256 "eb4f480f2f25731a518049c3737962042e7a6e0ededd0258e1a7c94db737eecc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.0/zoxy-0.8.0-aarch64-linux.tar.gz"
      sha256 "45003d990c126be49530e41a39736dddcf9c133cc3a3aec43ffedb6a4fd8b2db"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.0/zoxy-0.8.0-x86_64-linux.tar.gz"
      sha256 "89a2194ec086c5afc97e7dafc7cbcaabf25f4fedad01d0dfaa2b4a8ca2a11f85"
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
