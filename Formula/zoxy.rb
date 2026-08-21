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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.1/zoxy-0.5.1-aarch64-macos.tar.gz"
      sha256 "845718cb899cb83d8b62db5f25deb0ef713a700f909ad166d18798e5c8e5d2ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.1/zoxy-0.5.1-aarch64-linux.tar.gz"
      sha256 "4ae5f095903eae7044c3adf229d75e245034fab6bc9a6a8a8a8edffb4303f32a"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.5.1/zoxy-0.5.1-x86_64-linux.tar.gz"
      sha256 "9d99dad398e51bb4499df8f16782a837382d34f0d969ea183847875730d77980"
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
