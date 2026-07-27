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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.2/zrk-1.2.2-aarch64-macos.tar.gz"
      sha256 "03130cb133c1a544318b5c9ac75388a8fa04356829355a61f32077916b0ead52"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.2/zrk-1.2.2-x86_64-macos.tar.gz"
      sha256 "8807c2cbeb63f1df2c8b6b59660c4d757a26f866cb88d12df57ca01a1e195dcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.2/zrk-1.2.2-aarch64-linux.tar.gz"
      sha256 "ab3e38f73e3adc1556094eb69e1b0ef5b2164c91262a91f7c9e8a0d1f2f2f1e9"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.2/zrk-1.2.2-x86_64-linux.tar.gz"
      sha256 "8c774e4cf40632097418f1f0016da89a248aea7378b94f6e6bd7ce20ef8f383d"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
