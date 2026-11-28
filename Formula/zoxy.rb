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
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.2/zoxy-1.3.2-aarch64-macos.tar.gz"
      sha256 "64c7284bc6cc3a1e5276e48a72055998ceca9dea41a05a7845c98b5e867076e2"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.2/zoxy-1.3.2-x86_64-macos.tar.gz"
      sha256 "a8640071cbc393a9acb51790f2137859c21899a36cbaf11217b94601c46b9c5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.2/zoxy-1.3.2-aarch64-linux.tar.gz"
      sha256 "edb4499750e6862b40a80474d038e1fbd6bf87a108e2a50ff12e67b525363fe8"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v1.3.2/zoxy-1.3.2-x86_64-linux.tar.gz"
      sha256 "cf2aa64c1ef76d21d7a131f8220f574ff1607012af52a9e04af35259e1f1f124"
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
