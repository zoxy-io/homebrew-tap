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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.1/zoxy-1.2.1-aarch64-macos.tar.gz"
      sha256 "bbfcecac50fe06d9767043f1a6d97dd8d71d84b82e85ce6e3ff3b83e5db6a81f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.1/zoxy-1.2.1-x86_64-macos.tar.gz"
      sha256 "d206e809bc93a8b0a84844a638c8204a6b1b4a8a21b0672c966c9adc317b1921"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.1/zoxy-1.2.1-aarch64-linux.tar.gz"
      sha256 "6d55a3d1c39b2a6bec7fc2946c8162765f506d744e75cf303445a20430c57f10"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.1/zoxy-1.2.1-x86_64-linux.tar.gz"
      sha256 "760d3db927b16f7b23d8bdd0bcde8887966eb5d7a922ee6f8cfc682f990170e2"
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
