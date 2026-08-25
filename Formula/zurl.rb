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
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.1/zurl-0.0.1-aarch64-macos.tar.gz"
      sha256 "4fcfd8726d4b948278b7838bdb9cb2409467ab4de2143218387f8339a23bae37"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.1/zurl-0.0.1-x86_64-macos.tar.gz"
      sha256 "e3aec53b73bc0494896d4ffde51ec41d7091d4b3be9a7397a1196311e1fcc8e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.1/zurl-0.0.1-aarch64-linux.tar.gz"
      sha256 "b394e4bf34b3664cd2ede49601d31c23508df7edfbdaf86a580d1eecc6f180fd"
    end
    on_intel do
      url "https://github.com/zoxy-io/zurl/releases/download/v0.0.1/zurl-0.0.1-x86_64-linux.tar.gz"
      sha256 "b2d11465a91f2ea1c40cf28a7d1f7ae177ee7a95febe6c50e6610852f84a628a"
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
