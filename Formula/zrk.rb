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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.2/zrk-1.3.2-aarch64-macos.tar.gz"
      sha256 "c830e9a27e56e2e84896c1e1ef14c30db36cf78a3632fc6bd18b3d9e67a85e9d"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.2/zrk-1.3.2-x86_64-macos.tar.gz"
      sha256 "a2e7ea6fde74e91d7db2d61068f1665185c08baa6a5b5282d9987456565ccc96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.2/zrk-1.3.2-aarch64-linux.tar.gz"
      sha256 "94b11690c1e9ef07981d5447824182b62f49c6b533371eb1d5a90ec41fcd4f06"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.2/zrk-1.3.2-x86_64-linux.tar.gz"
      sha256 "68b4614394ba4a3bc0aa2dadc9af28997ee4908cc266182df3f19382f135ac21"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
