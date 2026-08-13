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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.1/zoxy-0.2.1-aarch64-macos.tar.gz"
      sha256 "178db77ce5e8c35f6cbba767cb9d22ea1f72c5540a2f3e78e9c7b0edb462a0bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.1/zoxy-0.2.1-aarch64-linux.tar.gz"
      sha256 "1ba0c5dd1dec4281a2220589e43728ff0241b5588f090cba8660a45bb12d090f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.2.1/zoxy-0.2.1-x86_64-linux.tar.gz"
      sha256 "98611ea66821e2b565c98923cbf9f14d9837cd79ef18f1bece79c68093663642"
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
