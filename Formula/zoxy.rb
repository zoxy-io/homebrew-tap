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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.1/zoxy-0.9.1-aarch64-macos.tar.gz"
      sha256 "7a3bd68d57fbdfce20048358131c5b3e03f014da691eb923a1f8cb960df52902"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.1/zoxy-0.9.1-x86_64-macos.tar.gz"
      sha256 "95c5f08e023a8105e967b4e5dc4e709c5e3f9f9c411b145cb39566c711cbd728"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.1/zoxy-0.9.1-aarch64-linux.tar.gz"
      sha256 "fa467da8c206cc8c7360a50271a233c5a796df54e5379434ca972b8f224b3f77"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.1/zoxy-0.9.1-x86_64-linux.tar.gz"
      sha256 "3f708c0f90203bd1dda6254881fd7b82d4e30519a5f00849aa6d013071183e60"
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
