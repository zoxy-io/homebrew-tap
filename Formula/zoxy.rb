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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.1/zoxy-0.10.1-aarch64-macos.tar.gz"
      sha256 "c7e510702fdeaf75fd2510f7052a05dbe22044d123ec37b7d08053589b40df82"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.1/zoxy-0.10.1-x86_64-macos.tar.gz"
      sha256 "787f1d51959ad87683f807509df79443850c82577c2d517fe85fb03bb9f973ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.1/zoxy-0.10.1-aarch64-linux.tar.gz"
      sha256 "b7ed1fdfdc1ce4798188c6a8aa7449e2b9736febc8d17c118a57c4c814709e17"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.1/zoxy-0.10.1-x86_64-linux.tar.gz"
      sha256 "e809a99e7a792fc615f8cc64181efd518369c497873b9062a62a2019f1a65b46"
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
