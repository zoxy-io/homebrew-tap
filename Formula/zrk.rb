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
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.3/zrk-3.0.3-aarch64-macos.tar.gz"
      sha256 "77572fab0e901bbe35029b22f9aeaeaceb69aea05c6747bb4661a270713a08fd"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.3/zrk-3.0.3-x86_64-macos.tar.gz"
      sha256 "ce4c2ee4e7f848ab3df781b9b3ff07e126d0bbba8fad46fdfc104231532b375d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.3/zrk-3.0.3-aarch64-linux.tar.gz"
      sha256 "86423b5db6ffb8c07a4698a5f6444b36e0c024aed98965a0fbaa67a75fe8afe8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.3/zrk-3.0.3-x86_64-linux.tar.gz"
      sha256 "9704e0e2a155594ae039f41bf6d67b3c70a9bad6ba64b335473a782bc434df3f"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
