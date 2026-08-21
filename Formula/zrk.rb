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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.3/zrk-1.4.3-aarch64-macos.tar.gz"
      sha256 "8511baacc2cbddd6c3c16293de06e927d8f8218beeea2114f6663534ed3812df"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.3/zrk-1.4.3-x86_64-macos.tar.gz"
      sha256 "6045a24a571c0fd309a612b29a0cbe14a053725b5a1c36faaae4d27961761fff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.3/zrk-1.4.3-aarch64-linux.tar.gz"
      sha256 "a1f7e1f9ac8e774d322ee87bb57e8136c86c74001a26bc0b45a40e46d1865c35"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.4.3/zrk-1.4.3-x86_64-linux.tar.gz"
      sha256 "867ddff3d5133d074700c984886f42fa32109333676fa7a9e34324d9a3c4a2ad"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
