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
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.2/zrk-3.0.2-aarch64-macos.tar.gz"
      sha256 "f8ec2a285ef39a9122e6e40fc760cbdc051b674a82bc25bf0e02931675b14360"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.2/zrk-3.0.2-x86_64-macos.tar.gz"
      sha256 "4372978cbb537023a61c7cfba369bfccfadc93634fbe0d3963712b21a0d64ef0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.2/zrk-3.0.2-aarch64-linux.tar.gz"
      sha256 "ca375a4801df5aab86e837bf5183895194af0ec500a762482e4603ba3e109d05"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.2/zrk-3.0.2-x86_64-linux.tar.gz"
      sha256 "339ade3ba435f14ea3c15ab8e97a880d931e14604857cde01aea1797e7430cbf"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
