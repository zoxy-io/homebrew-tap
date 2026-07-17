class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://github.com/floatdrop/zrk"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.1/zrk-0.3.1-aarch64-macos.tar.gz"
      sha256 "57734433d23dcdea038211dc2d3c56913046d41a5c1608c4217acbb2d6944006"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.1/zrk-0.3.1-x86_64-macos.tar.gz"
      sha256 "894229b4b2416853d9e99884c90ba153a7d226d8568730579ac0d5e564309e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.1/zrk-0.3.1-aarch64-linux.tar.gz"
      sha256 "e64e4b000a15938cb539385fc3dc5641fac821acd933d90f852d0f0faea9e755"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.1/zrk-0.3.1-x86_64-linux.tar.gz"
      sha256 "de9915f744d0865e63fbf22202fdd370ef5d2e6b2d6240fcace7f51d26076227"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
