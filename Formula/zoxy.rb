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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.3.0/zoxy-0.3.0-aarch64-macos.tar.gz"
      sha256 "348e249ee698b6cb88e5fa7f544e897cd4f4392a06cd5ab4f7c24a14d8e3986e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.3.0/zoxy-0.3.0-aarch64-linux.tar.gz"
      sha256 "48561c6b6a3b13e03dbc4885d44f939299725fff4674f93935273ba607dcd2f5"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.3.0/zoxy-0.3.0-x86_64-linux.tar.gz"
      sha256 "8c7b7020f45ceaea86a48ce7a9c817c733e404776f9c975dad6f3d99a924cd62"
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
