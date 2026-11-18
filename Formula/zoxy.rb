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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.0/zoxy-0.12.0-aarch64-macos.tar.gz"
      sha256 "386999d971d3f5ff9760ca609aed29e3af7226ce60468370f092040d86d455a8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.0/zoxy-0.12.0-x86_64-macos.tar.gz"
      sha256 "3dfccc91060d07e18457c6b2be621eab6888021d293d2c025f6d253b818baf34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.0/zoxy-0.12.0-aarch64-linux.tar.gz"
      sha256 "ec913bf167db03eedfb2632d1dd4cdae25591463b7f55bd4b1b9270d280ca25b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.12.0/zoxy-0.12.0-x86_64-linux.tar.gz"
      sha256 "bfca7ed5ae08a706ddea90915bde64781548ebb558b53121b6ca0a709d8223d9"
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
