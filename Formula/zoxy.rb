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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.1.0/zoxy-1.1.0-aarch64-macos.tar.gz"
      sha256 "16fe5ed452fc5769256e5d976684871d0455b83fb74a60c133362bc184ca3748"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.1.0/zoxy-1.1.0-x86_64-macos.tar.gz"
      sha256 "1d0431fd808849b7f6a3d17dbd99be53e05678b7e6c382384ec5542eb45dddd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.1.0/zoxy-1.1.0-aarch64-linux.tar.gz"
      sha256 "cbde227db980fe1a3fa14fd1b246afccd0b922c7835b7cff07ce966dfd0ccc08"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.1.0/zoxy-1.1.0-x86_64-linux.tar.gz"
      sha256 "a135e6ca6d2cdb74f266a6af6190c546250a60f9fcc297d875d08c6b554f8672"
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
