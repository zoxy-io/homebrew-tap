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
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.0/zrk-0.4.0-aarch64-macos.tar.gz"
      sha256 "f231d3843bf069a9c700017aec96dee68ff8f8af67cdef2b110e2a5491451561"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.0/zrk-0.4.0-x86_64-macos.tar.gz"
      sha256 "a54435c2f8f686077890979ddc6ce27af23613f167fac06e6616848d180f2be9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.0/zrk-0.4.0-aarch64-linux.tar.gz"
      sha256 "de3de9d80c030d01d14447c407ddc56d31c573570baacdccdddd3cc814073055"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v0.4.0/zrk-0.4.0-x86_64-linux.tar.gz"
      sha256 "2e095d0428621561a66b6cf57a2aa95cde876e965ebdf57a052c42a574b0874a"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
