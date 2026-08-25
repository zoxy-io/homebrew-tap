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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.0/zrk-2.2.0-aarch64-macos.tar.gz"
      sha256 "308a25823213af381b191ebbe4e42b5d97c64b961ebbeb142dac6cde64174ffb"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.0/zrk-2.2.0-x86_64-macos.tar.gz"
      sha256 "60077b21a6a7978460ec48a4f1a941db2135141e1bf54a7c56369177e885ddca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.0/zrk-2.2.0-aarch64-linux.tar.gz"
      sha256 "b18eea16e04eecde9573c10c90a903230081dbf8ce619d7b77bff501224510c7"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.2.0/zrk-2.2.0-x86_64-linux.tar.gz"
      sha256 "bc2b93911491e510300c1490c7a1d37b307cb00e0a4c6a4f48de2fdda51d8dc6"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
