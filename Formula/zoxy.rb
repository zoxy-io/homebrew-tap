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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.2/zoxy-1.0.2-aarch64-macos.tar.gz"
      sha256 "a5cbb393fc93035e3c1d3ea5b3f0d4cd599ab984c10be5dfcac87c4daa052585"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.2/zoxy-1.0.2-x86_64-macos.tar.gz"
      sha256 "b0c88c7cddb53d59feb3985a7d536a3596e1d0172b2d38fcb1ea09bc3c845a9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.2/zoxy-1.0.2-aarch64-linux.tar.gz"
      sha256 "cb8bea06145f7feab0c7ec98f11ed333d30eef492b034045db702c95493b7413"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.2/zoxy-1.0.2-x86_64-linux.tar.gz"
      sha256 "a27fc1e57890ba60fc81e1b63a2e9c3b2374d335ba98f5448fcc9c7dde238fa0"
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
