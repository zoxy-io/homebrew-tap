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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.0/zrk-2.1.0-aarch64-macos.tar.gz"
      sha256 "395b3086a71228e69f8ea018d2abbf33f6e824646840749f8d05867486beafc3"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.0/zrk-2.1.0-x86_64-macos.tar.gz"
      sha256 "60574c1a57c75e8da58d904dddb5507b7fa18f259a57a1da60ab922cdc416671"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.0/zrk-2.1.0-aarch64-linux.tar.gz"
      sha256 "9d84aa605777c50799c2518233891e48f82b15bd485931542648be52481126d0"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.1.0/zrk-2.1.0-x86_64-linux.tar.gz"
      sha256 "cfd42077a674b2edc34235e2fd74ad8ca5f13c847df8ed4b3665be1b2370c373"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
