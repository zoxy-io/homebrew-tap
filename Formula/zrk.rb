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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.1/zrk-1.0.1-aarch64-macos.tar.gz"
      sha256 "038a144e3483f80d33a050088a9572d622f4da1cbdc9ef7791a4a7c504935c94"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.1/zrk-1.0.1-x86_64-macos.tar.gz"
      sha256 "dd0556dc1436daec3c9775d43ae2f9f981feff88f2b9008a3ba693d2b94cfe98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.1/zrk-1.0.1-aarch64-linux.tar.gz"
      sha256 "0e21450221571263058c5dd881c6b50ac1714910a2c499776ca09c7951847ea6"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.0.1/zrk-1.0.1-x86_64-linux.tar.gz"
      sha256 "7f70102faefdfe425dc8626f7ff3993b9dcd4715b15f12ec6872e1169ac6f9c2"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
