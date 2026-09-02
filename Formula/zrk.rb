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
      url "https://github.com/zoxy-io/zrk/releases/download/v2.5.0/zrk-2.5.0-aarch64-macos.tar.gz"
      sha256 "3044af04d7ef933db4c0c6583518e0d49accec0f49e2cb23050c1cbfac33e747"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.5.0/zrk-2.5.0-x86_64-macos.tar.gz"
      sha256 "b6011156d11b6ca0c6b875ef4b435535a720ec9d8638bf0863672d699d6975f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.5.0/zrk-2.5.0-aarch64-linux.tar.gz"
      sha256 "6ca89267e45e8e100d06c08b5e481cb2502268250b0f388bf64c4f91e0c3aeb8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v2.5.0/zrk-2.5.0-x86_64-linux.tar.gz"
      sha256 "b2d1de7791768317793b198fbba2a8299ba630c44be699b06d9be3b8a1fe7905"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
