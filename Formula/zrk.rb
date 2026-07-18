class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/floatdrop/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.5/zrk-0.3.5-aarch64-macos.tar.gz"
      sha256 "07d79d9255bccd3871dba179155b135c97366d21bb9daf585d3902806d0fa7ba"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.5/zrk-0.3.5-x86_64-macos.tar.gz"
      sha256 "58312c4eab89566c49175cff78f18f7bf1dd3dc4ac7f3ead01e6447b7b7fdcf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.5/zrk-0.3.5-aarch64-linux.tar.gz"
      sha256 "e563b514e51b3b2737e4fbb14a1e74970518743df54f09cb9127a9870eb366cb"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.5/zrk-0.3.5-x86_64-linux.tar.gz"
      sha256 "1f8a17986c19a151fdb8c375a1289815139c3eca203321ca5f0b4f46eec4aa77"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
