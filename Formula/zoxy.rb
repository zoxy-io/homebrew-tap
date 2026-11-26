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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.0/zoxy-1.3.0-aarch64-macos.tar.gz"
      sha256 "2f346c41bab2d546b3a60bb2290dae6d7fd2d9c20b21e7ca419bdfd00164acb8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.0/zoxy-1.3.0-x86_64-macos.tar.gz"
      sha256 "75cef86fe4188d575957bd1ed72f9576f1a6ebdb9b9512e774a11c06d70975d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.0/zoxy-1.3.0-aarch64-linux.tar.gz"
      sha256 "aa5ac0e3839a2cab07462acae87fcf372a17062d6bc0e858218b683c637d27ab"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.0/zoxy-1.3.0-x86_64-linux.tar.gz"
      sha256 "ddd7242eebaa2e642ad70d487863ad373cb8d384ed94657af9835dbedd810d7b"
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
