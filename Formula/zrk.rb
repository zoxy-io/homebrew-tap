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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.0/zrk-2.4.0-aarch64-macos.tar.gz"
      sha256 "32de7c0bfe40cd22f4dd1116692eb40d7a29ad5c4c1efc5e7e5a6e3bf8e6e212"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.0/zrk-2.4.0-x86_64-macos.tar.gz"
      sha256 "1e55f7c77950f4f14d5f8760522217e872cc9d4fb5db90bde187aea5ab7d2875"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.0/zrk-2.4.0-aarch64-linux.tar.gz"
      sha256 "7982939c3b3e949731d2622817e273880bcc6fe1588f1f598e720a3dd789ae7c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.4.0/zrk-2.4.0-x86_64-linux.tar.gz"
      sha256 "a0918e5b618de4926c23afad21e42f1bd881e6363dcef7bb635154cb1b0848c5"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
