class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.7/zoxy-0.0.7-aarch64-macos.tar.gz"
      sha256 "05776ac94dd2c110f2a4098894afc2e884ddfc0d0b72de2c84be159db6f62faf"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.7/zoxy-0.0.7-x86_64-macos.tar.gz"
      sha256 "85ab3ab864e36443042b8067ef9abda7217cb5469575d0fd925ed5c27c6ad864"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.7/zoxy-0.0.7-aarch64-linux.tar.gz"
      sha256 "7017276b3da3488767395b77119d5e40db1e4db205426cab6a3fcac6fba2510e"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.0.7/zoxy-0.0.7-x86_64-linux.tar.gz"
      sha256 "1ab011da32254bb8dea64833824f089efaf4d3e95c8e288b55ddadd292f21e02"
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
