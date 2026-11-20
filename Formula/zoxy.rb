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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.3/zoxy-1.0.3-aarch64-macos.tar.gz"
      sha256 "6b102a04a5371ab2ebc041913f8039d4e89da61dce3c6047227996c20b6b5b70"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.3/zoxy-1.0.3-x86_64-macos.tar.gz"
      sha256 "692b2354d7941dff8d13cc6220a246a1f91efbc8b541745a7073c8d2bfd3457a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.3/zoxy-1.0.3-aarch64-linux.tar.gz"
      sha256 "846068a173ee269cea01153040cb3bd2226b2002a6ec7695f303b1d6e3e0f059"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.0.3/zoxy-1.0.3-x86_64-linux.tar.gz"
      sha256 "5af49f6949570678d62752c475eb8ef3b6ac97c8d0c8bda34f7c5d744db4103a"
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
