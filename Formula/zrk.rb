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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.1/zrk-2.1.1-aarch64-macos.tar.gz"
      sha256 "b652811ddef4bb2c858bb6c18cd7683fbc962376e5b79a8a457a635762de75b4"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.1/zrk-2.1.1-x86_64-macos.tar.gz"
      sha256 "6af3e9be9ee2bc4f90d88990f8619db63a2a92f84f1fb61756cd68c91f42674c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.1/zrk-2.1.1-aarch64-linux.tar.gz"
      sha256 "256bdf639cc6780476a2fbc4dd9f94e91bb0bc66f49834d1984eb8ad2547d2ce"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.1/zrk-2.1.1-x86_64-linux.tar.gz"
      sha256 "2760658506ea4a3fc87c3a52c52a0b8118414db9bded5f4093cab63271d272b4"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
