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
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.4/zrk-3.0.4-aarch64-macos.tar.gz"
      sha256 "aae6fa3322c41e6b0ee188d00fcae93cbb356795b87c8c7944c75e6fd77260aa"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.4/zrk-3.0.4-x86_64-macos.tar.gz"
      sha256 "a63ab23b85e91f09f311eed2a781b4c10e494686d6ebd4fba30ad5e30544af94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.4/zrk-3.0.4-aarch64-linux.tar.gz"
      sha256 "bdb5a9f9898667fe8ca33c425d095c88b0242a8134c9e8a73db02a3a3f786f24"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.4/zrk-3.0.4-x86_64-linux.tar.gz"
      sha256 "bfbaf585cc9a4ede7728ed4f2d5a5da8b0ec26fe9fb173fe1c6bc3f13d4e0d15"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
