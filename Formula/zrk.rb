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
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-1.0.0-aarch64-macos.tar.gz"
      sha256 "050a1365b8432f3db3a5b6f1406834da560da6baf64cb93550839ba7942064ef"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-1.0.0-x86_64-macos.tar.gz"
      sha256 "70ed726e1c900a1159bc6c5a5a921c762024f4d88998929a0d079aafb6934515"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-1.0.0-aarch64-linux.tar.gz"
      sha256 "42e5ba57be0705436e6320b64d4f70dbf347e80cc3e0c23bd49e1ab35d575d20"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.1/zrk-1.0.0-x86_64-linux.tar.gz"
      sha256 "0279d6a64fbb033ccb252571e04d52c84dcf4bcdc8ecdecc492d4fa02e478f4f"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
