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
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.11.0/zoxy-0.11.0-aarch64-macos.tar.gz"
      sha256 "a948baa809a72e54a218a26310b7ccec06d601368d659fd2ac0726210991bcda"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.11.0/zoxy-0.11.0-x86_64-macos.tar.gz"
      sha256 "914fdcd6be26ce50833aac6a6d4483567fb0615415be7eea712d1449fd0e76c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.11.0/zoxy-0.11.0-aarch64-linux.tar.gz"
      sha256 "5ac3a04775a84370ec549f65e265d2a22ca62c27fce461e9a5dce06a49ab6296"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.11.0/zoxy-0.11.0-x86_64-linux.tar.gz"
      sha256 "bcfa131d8cb477846b9392783eb8f30b6ad208be09eba29cb84eafb30e38155b"
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
