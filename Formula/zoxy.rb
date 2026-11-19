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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.1/zoxy-0.12.1-aarch64-macos.tar.gz"
      sha256 "695f9b2f1fd632409fd0faa264610b9f3c8d5ad93c110dd8976331786e382aab"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.1/zoxy-0.12.1-x86_64-macos.tar.gz"
      sha256 "b81b2821c8541244961584d2423c4e1d7e17f032ecc22eb3a0c1dfbb2a65f38c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.1/zoxy-0.12.1-aarch64-linux.tar.gz"
      sha256 "23a09f424aa666f9220228c416872652cfde0020e3ed0c79e0cb8f0dcbeab04e"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.1/zoxy-0.12.1-x86_64-linux.tar.gz"
      sha256 "81047632958b9744dd5eff1f84d81fcc1fa64529f39042848b79f8042b7ca84b"
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
