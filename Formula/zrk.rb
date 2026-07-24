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
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.1/zrk-1.1.1-aarch64-macos.tar.gz"
      sha256 "86f12455ded1d3374cebbfb2ce04f4afbad914bfcd3a764b9c415c75028052c0"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.1/zrk-1.1.1-x86_64-macos.tar.gz"
      sha256 "c47e306acb4f27ae4f203d8be7c85b5c18d5783f011e89adcc3b092ba5c83708"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.1/zrk-1.1.1-aarch64-linux.tar.gz"
      sha256 "2cf890f051ff9b7eef7ddd03d200f3ccc8b299a155847658672aa149d32f35dc"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v1.1.1/zrk-1.1.1-x86_64-linux.tar.gz"
      sha256 "bfc0dd87757a3812da2311a63445270189d54103abcf46fe1d6c3112c631d3fd"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
