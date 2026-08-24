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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.2/zoxy-0.6.2-aarch64-macos.tar.gz"
      sha256 "0c7d2963023e346e4a59946c4491cdbf73a466a4ae9fed9a34ed9cb04e994c9e"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.2/zoxy-0.6.2-x86_64-macos.tar.gz"
      sha256 "54ff1ad6235a17513683656d4c8b109deaba6e7e320553d876ed3403e80a469a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.2/zoxy-0.6.2-aarch64-linux.tar.gz"
      sha256 "02ad8f99c47e037fcd895e703f4b99c3400efbfea90fc8824bf40f9617447711"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.6.2/zoxy-0.6.2-x86_64-linux.tar.gz"
      sha256 "232062e8610eecbfd64ecbb254b3631a0640fc16a051900e04513440077ff300"
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
