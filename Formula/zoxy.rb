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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.1/zoxy-0.8.1-aarch64-macos.tar.gz"
      sha256 "2ebae0a0fbaa2b1fb28f74fd6cc4dcc97a8b5aba1a6a6cba9837e9abb0a573cd"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.1/zoxy-0.8.1-x86_64-macos.tar.gz"
      sha256 "729723ed38c646872b5ddf33e50e7efd2896ed4cb6bce117aee63072f374d716"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.1/zoxy-0.8.1-aarch64-linux.tar.gz"
      sha256 "4cfacb69eac4e61f0074b68f6f355b3f81824f4b3b03db0e75e58459cb036920"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.8.1/zoxy-0.8.1-x86_64-linux.tar.gz"
      sha256 "627e08d65799dfa87806b4d24b8c71ea8cac4751176cea4589c9bd02c7958af1"
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
