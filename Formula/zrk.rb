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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.1/zrk-1.3.1-aarch64-macos.tar.gz"
      sha256 "360ff9864a94266912c7d0d9ab98f46fe16d8b43fe5dd1fd1aac2801bd2d6d51"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.1/zrk-1.3.1-x86_64-macos.tar.gz"
      sha256 "1179edf10319de75e7857bcbfba8b6a093455250c5b7721e45354871bd166ebf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.1/zrk-1.3.1-aarch64-linux.tar.gz"
      sha256 "e77404f87383c5cc78be3426c777b0b7b88ab667845350714da2b9f3acc92809"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.3.1/zrk-1.3.1-x86_64-linux.tar.gz"
      sha256 "d19eea743b29f6ae32a90f2116cb26f87ad8008bf1a6498cb546a5c3a9eb93ee"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
