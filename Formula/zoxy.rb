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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.0/zoxy-0.6.0-aarch64-macos.tar.gz"
      sha256 "88715e227e5aead8a2d46b74fb8a9e0fc4f93a9ed1f8802be2f9227c1a517f7b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.0/zoxy-0.6.0-x86_64-macos.tar.gz"
      sha256 "60269bb1096f359a5555a720d07ab0a8bf3d08723051906ca359b01664a184cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.0/zoxy-0.6.0-aarch64-linux.tar.gz"
      sha256 "7debe216f12a8f561514a07c23514b2ad23269cf7258fe513f9446be407ed507"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.0/zoxy-0.6.0-x86_64-linux.tar.gz"
      sha256 "91ec346eddef0928d0f989e0aea00c4aa6ebedf980a992d1bd61e8482c1208ca"
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
