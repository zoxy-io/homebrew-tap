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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.0/zrk-1.1.0-aarch64-macos.tar.gz"
      sha256 "88dcb731f757d8f154e75f9c23658ee70776c7a0b96e8d126c14f294a46c23f8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.0/zrk-1.1.0-x86_64-macos.tar.gz"
      sha256 "b0f774c61abd89a43b29219bfd898942dcdaabcf3535b922569681d4ebf8941d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.0/zrk-1.1.0-aarch64-linux.tar.gz"
      sha256 "e8ceafe41e426dabad05981a6620fd5e19b21dca80a8719a4d739ac529b82210"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.0/zrk-1.1.0-x86_64-linux.tar.gz"
      sha256 "0da9616408fc5e8e8be1509b1f87301836c9ca78bc803290845ad8a2ddfe1b98"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
