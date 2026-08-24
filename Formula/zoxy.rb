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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.3/zoxy-0.6.3-aarch64-macos.tar.gz"
      sha256 "136411161f1a794d581c5d085ce98d4c70d264930c3a77abd2c3d1fefa9b7542"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.3/zoxy-0.6.3-x86_64-macos.tar.gz"
      sha256 "79504394b200abf1a03e68f63706379b08eead569317b31f594b1c53f00e2918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.3/zoxy-0.6.3-aarch64-linux.tar.gz"
      sha256 "20b315b7bcbbc5ead4e8dfc09e1364154ad6e99eebe111160feb8e101f6f05c7"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.3/zoxy-0.6.3-x86_64-linux.tar.gz"
      sha256 "8c178ba46bc049ffd770e5c909d43d04bcb2de619bf5eabe9e595d4bb3354557"
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
