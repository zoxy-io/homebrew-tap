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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.1/zoxy-0.4.1-aarch64-macos.tar.gz"
      sha256 "d04cf03bc674cf88d8d52195804564bdd2d32a59d9682a55449cac57d31e8c68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.1/zoxy-0.4.1-aarch64-linux.tar.gz"
      sha256 "676aaa39f5253eff47d9438b33ae5d176aeaa3e2f5e6d3031e820f60990d7742"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.4.1/zoxy-0.4.1-x86_64-linux.tar.gz"
      sha256 "9856a090859e76601aa67ffa1047db1cdb1e8889974b7afe4bae7dd4cda0af81"
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
