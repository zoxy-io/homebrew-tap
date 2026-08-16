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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.0/zoxy-0.4.0-aarch64-macos.tar.gz"
      sha256 "0ff08b39498e380d76d6e016def2f161198bdfb5669f2fc01be069d5b2b66bef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.0/zoxy-0.4.0-aarch64-linux.tar.gz"
      sha256 "1b4a0602d7d32e6219ae6731f6e9c031e2e92bd5299841214f1b1c628a2a8649"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.0/zoxy-0.4.0-x86_64-linux.tar.gz"
      sha256 "370b918734e3c5427f0fb807f2a481e6c826e45c8c0365e2d6fbe1bd9c9e44dc"
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
