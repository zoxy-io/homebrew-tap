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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.0/zoxy-0.5.0-aarch64-macos.tar.gz"
      sha256 "9b89429372cf915474e712d85a4c752075ac2f50ec98015c98a96be97afa3bac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.0/zoxy-0.5.0-aarch64-linux.tar.gz"
      sha256 "2fac2c417effa31e569e8c127d80c591f303d7f124969fbf4379a24567e367e0"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.0/zoxy-0.5.0-x86_64-linux.tar.gz"
      sha256 "64180bf7706b3cc1b5bb0ca090ac5e7010aff6c75806bfa39f06378d596b46ba"
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
