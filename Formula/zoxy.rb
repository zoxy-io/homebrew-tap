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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.2/zoxy-0.8.2-aarch64-macos.tar.gz"
      sha256 "7b722992f087b1a2d20cb528208d64fd58c1e1c782bd5942215f7bf10863a95a"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.2/zoxy-0.8.2-x86_64-macos.tar.gz"
      sha256 "1813512853a4e90f5b81f8dc80668d711c57bffadeb378155413aee89e82b571"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.2/zoxy-0.8.2-aarch64-linux.tar.gz"
      sha256 "368a4d771984769a5a855f745ecfcb71667128f57fe50d1900793b53e0cead5f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.2/zoxy-0.8.2-x86_64-linux.tar.gz"
      sha256 "614ce02cedb4f418cc5881005afef044221373b71585086ea67a500366ca1d24"
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
