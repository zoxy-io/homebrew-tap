class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  # Apple Silicon only. There is no Intel macOS bottle from
  # 0.2.0 on: building one needs an Intel macOS runner, and
  # GitHub's is retired. Homebrew on an Intel Mac will report
  # that no bottle is available rather than download one that
  # cannot run, which is the failure worth having.
  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.1/zoxy-1.3.1-aarch64-macos.tar.gz"
      sha256 "4162e6631a0b1812b474051efc9369e4f48e8f4fab875120d49a9a77d4555eed"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.1/zoxy-1.3.1-x86_64-macos.tar.gz"
      sha256 "8044af27c1d3ab47552b28607459f31102b21ffaeb80038b87a7a107a50459f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.1/zoxy-1.3.1-aarch64-linux.tar.gz"
      sha256 "3a469b521fd411fdaa5c67c119bef17573a76464ce2a5ec1a985a544f54c88af"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.1/zoxy-1.3.1-x86_64-linux.tar.gz"
      sha256 "8195e22addb4eeb9d035e016e29516de19963bd49d0773fb6e5e2767d6426225"
    end
  end

  def install
    bin.install "zoxy"
  end

  test do
    output = shell_output("#{bin}/zoxy #{testpath}/missing.json 2>&1", 1)
    assert_match "cannot read config", output
  end
end
