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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.0/zrk-1.4.0-aarch64-macos.tar.gz"
      sha256 "328ea4078a6b34c3dedcf0c043d0d77b76c4362bac02324680dfc0eec904108c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.0/zrk-1.4.0-x86_64-macos.tar.gz"
      sha256 "1dfa71398ca0411107e27ee2b41744cfea963d03e79def48bc033691ff129e10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.0/zrk-1.4.0-aarch64-linux.tar.gz"
      sha256 "9157db5ca1f9a1b4fa1c0920d2ec89b29601795a961529b56b2f370ae39f4678"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.0/zrk-1.4.0-x86_64-linux.tar.gz"
      sha256 "9841b1e2a4eca1e18d14fe4c29d6f38af61804d454c0a4af84df9bfc71f5ae99"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
