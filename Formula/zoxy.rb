class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.10/zoxy-0.0.10-aarch64-macos.tar.gz"
      sha256 "ee625b3cf0a8dae14a63e1db91a76d3ed83d7b3e5cc35ea4cd282c30823db460"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.10/zoxy-0.0.10-x86_64-macos.tar.gz"
      sha256 "5624f7f264932dcfbdc68183247c69bb4b2109b9b3b8d65356fbfb6674a04870"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.10/zoxy-0.0.10-aarch64-linux.tar.gz"
      sha256 "425561d9c614bc05c9b69cc8c4d553d984cb39e032762faa105706e7dc136803"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.10/zoxy-0.0.10-x86_64-linux.tar.gz"
      sha256 "304504c71327946a46e57823b8ba773008c33f3b1d7c6f3be350b61f6a243386"
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
