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
      url "https://github.com/zoxy-io/zrk/releases/download/v0.3.6/zrk-0.3.6-aarch64-macos.tar.gz"
      sha256 "8c08d0b3f85c676339fb849a2d88ddc1c0d041da4505208b6629b0e701f7e3e7"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.3.6/zrk-0.3.6-x86_64-macos.tar.gz"
      sha256 "9b6b9755f13fc60a3a43a53846b434cb7af2c38633f1cdffdbad1af4339b8937"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.3.6/zrk-0.3.6-aarch64-linux.tar.gz"
      sha256 "60574c8ceeb78ac66f01ca5f19ad1a53393d564e1cfca2ca961a94f2c10f39a7"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.3.6/zrk-0.3.6-x86_64-linux.tar.gz"
      sha256 "006caed014aefc56e875c0614e9a7d6a09d684bf318ecb66d0103ab7f18484ab"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
