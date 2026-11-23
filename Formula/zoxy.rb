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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.2/zoxy-1.2.2-aarch64-macos.tar.gz"
      sha256 "205bcb46e8162e2afc61259a4e3e2a8235aeb619ce12203f91f72302bfc6560b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.2/zoxy-1.2.2-x86_64-macos.tar.gz"
      sha256 "4e2dcd9f2189355594889f4e7c166448efe2cf07b40d24175bdb92a6f22afbfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.2/zoxy-1.2.2-aarch64-linux.tar.gz"
      sha256 "29c52c3883c0ed716b99b7fe4d051e85e5993632d00944dae56e9bd1a2ea55a5"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.2/zoxy-1.2.2-x86_64-linux.tar.gz"
      sha256 "b63bfa08e00161379fa2cac5bb230c7de31f35ad25af53f1edff33cfa5f70a7f"
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
