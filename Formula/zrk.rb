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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.2/zrk-1.4.2-aarch64-macos.tar.gz"
      sha256 "215d77e3c69e406be9b8c6934d451d8cb1ccd62756ac5e4ac21b73271bb441d6"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.2/zrk-1.4.2-x86_64-macos.tar.gz"
      sha256 "f9727e441c75cfa0f9df22cf7232160d16a1f4a32ccd211efb3dbc3763535261"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.2/zrk-1.4.2-aarch64-linux.tar.gz"
      sha256 "10c0e3b593d1667fcf60a7e139f757b8740a7c0f6f110a6ef53febe8254d0693"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.2/zrk-1.4.2-x86_64-linux.tar.gz"
      sha256 "b0fc0c3e73c7541721e0a665c52f1e414c41010d2866f9867b637409dcb1dbb2"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
