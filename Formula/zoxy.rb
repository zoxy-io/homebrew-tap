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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.1/zoxy-0.6.1-aarch64-macos.tar.gz"
      sha256 "64fa6aa1bb5c6c1842f4c92f9c4d72a5807b0302a2ae68b5d7651ca5363f4d8f"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.1/zoxy-0.6.1-x86_64-macos.tar.gz"
      sha256 "ac87c3f8e8bfbfa7437101edc9d65b1ab07dca737a3103e490dcbd9ea2eec554"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.1/zoxy-0.6.1-aarch64-linux.tar.gz"
      sha256 "2c657f716a389233add56a9dc5b1221c81286a8150a525f4953d8d5c4c54237c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.1/zoxy-0.6.1-x86_64-linux.tar.gz"
      sha256 "cbcff5b44a79c64a3aef4f1bdcab795f88a77929973bdbd41f19ca3093d1d541"
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
