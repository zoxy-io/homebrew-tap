class Zurl < Formula
  desc "Zero-allocation std.Io-native HTTP/1.1 client for Zig"
  homepage "https://github.com/zoxy-io/zurl"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zurl"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.2/zurl-0.0.2-aarch64-macos.tar.gz"
      sha256 "61d732b00d341b9d1679ab90e88119e18e4915cd03ff0f91a5039d7c02e55371"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.2/zurl-0.0.2-x86_64-macos.tar.gz"
      sha256 "e8e7887db10ff324ae54d9b8aa1bd160e965886d971e9c95b2b2ce89c9a32842"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.2/zurl-0.0.2-aarch64-linux.tar.gz"
      sha256 "97f653a2e550c87f12ab0fae5c7dba96f931aa68a407d702b7e46b01f937b118"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.2/zurl-0.0.2-x86_64-linux.tar.gz"
      sha256 "8b15324e291907964a7331fd3347980ce6b6991bd654f98aa6a2822ea6dcefc1"
    end
  end

  def install
    bin.install "zurl"
  end

  test do
    output = shell_output("#{bin}/zurl 2>&1", 1)
    assert_match "usage: zurl", output
  end
end
