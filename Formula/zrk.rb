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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.0/zrk-1.2.0-aarch64-macos.tar.gz"
      sha256 "3c4e5aee72b398d854df72144566a12d0666029248cda542c36bcea89132b4ff"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.0/zrk-1.2.0-x86_64-macos.tar.gz"
      sha256 "90773de0e31bbc17c8821d398c54eda9821176a87dddf8d06a293156c6fff845"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.0/zrk-1.2.0-aarch64-linux.tar.gz"
      sha256 "8583ef3e19105f6e451e33a1b17e50c5765e978f0ffa47431f7bb5186d43ebdd"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.2.0/zrk-1.2.0-x86_64-linux.tar.gz"
      sha256 "ee6cf562282e46fd521c1da08cabaff991b3ed180a1efbf923b42c6e71e5de95"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
