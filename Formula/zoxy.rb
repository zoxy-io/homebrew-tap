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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.1/zoxy-1.0.1-aarch64-macos.tar.gz"
      sha256 "6f2c43881bd18c7ccc95f0214e436b0d890eb1def3d253975b9cc776fde09ca2"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.1/zoxy-1.0.1-x86_64-macos.tar.gz"
      sha256 "aeefb0d12c4e449e313875ce05045b3ef85af11a0399e02f326b9d70479eadbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.1/zoxy-1.0.1-aarch64-linux.tar.gz"
      sha256 "7ff5967da5e3f8e5d66ae14b8f0c6a42936a2018c0fb12a2d5bed62bbdbb81c1"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.1/zoxy-1.0.1-x86_64-linux.tar.gz"
      sha256 "d3fb873c0b840cc33165a75cf6e03deb6058a809941c5586b0c967096d220fb9"
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
