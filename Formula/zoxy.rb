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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.0/zoxy-1.2.0-aarch64-macos.tar.gz"
      sha256 "26d5840e44b45d8e8abdfd67687f726a6cb6e09021a9fc3fafdd31d37cf9c2cb"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.0/zoxy-1.2.0-x86_64-macos.tar.gz"
      sha256 "1054705f1051aa47aada8a0f65ddf8cbcddcf8b27bfb1a21a55a3087789b16b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.0/zoxy-1.2.0-aarch64-linux.tar.gz"
      sha256 "ebbd45e8eea52f0806778d662a6319762b0066ccb5928cd3f936663eab545edc"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.2.0/zoxy-1.2.0-x86_64-linux.tar.gz"
      sha256 "deae7fa47471675159b3f48c2fb8c2e963629bbbb6bf1cb9b7e45c510dba9df9"
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
