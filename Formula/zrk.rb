class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.5/zrk-3.0.5-aarch64-macos.tar.gz"
      sha256 "a02f8df84e8b2ea0418c20ae7a2a6113814759b383998134af8ae30009d4fd92"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.5/zrk-3.0.5-x86_64-macos.tar.gz"
      sha256 "10f3dfa8f9435b8ae02ccc7279937242a31642df63827bf7d6ac1778ae77e342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.5/zrk-3.0.5-aarch64-linux.tar.gz"
      sha256 "6e2bea16e467193e9dcf6420e1692d3fb4e999f77fe7e374298516b8b330547b"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.5/zrk-3.0.5-x86_64-linux.tar.gz"
      sha256 "7416bf9260b262ffe748f58201fdb919dee295489945c954898a8ab26ec866d6"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
