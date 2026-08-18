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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.2/zoxy-0.4.2-aarch64-macos.tar.gz"
      sha256 "f0d68bb2ae881646468b4b5b5c23d63586a96908bde8d729fae2171c4c0f5c4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.2/zoxy-0.4.2-aarch64-linux.tar.gz"
      sha256 "ac657016dc910f93bc155c4372104ecf26901556d41136a4a03ea58e1f205dfa"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.2/zoxy-0.4.2-x86_64-linux.tar.gz"
      sha256 "e0798e0149495939790618833ba8a65198bc57b06e1224fdd9f329f0d6585e8c"
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
