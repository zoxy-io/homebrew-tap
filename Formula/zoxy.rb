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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.0/zoxy-0.10.0-aarch64-macos.tar.gz"
      sha256 "60fabd4bff5ff677bb484bc86efe843c76b8e4222ccf5685ed245c6684bb24eb"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.0/zoxy-0.10.0-x86_64-macos.tar.gz"
      sha256 "c285d99e419b4496ea59c476dbf0030f64f5857e98c5c8900b38e59505c37810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.0/zoxy-0.10.0-aarch64-linux.tar.gz"
      sha256 "cc704f3e6bb1a783c243aa0f26bbbc75f28760900487af4eec42ccd5bac1bdb2"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.10.0/zoxy-0.10.0-x86_64-linux.tar.gz"
      sha256 "4520e0737bdabf1885daa130613fb740c1922e39e4edc637f079257cae12ebb1"
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
