class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/floatdrop/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.3/zrk-0.3.3-aarch64-macos.tar.gz"
      sha256 "7df3c52d07613d2c1ab68951723892d846fc47b73cd96625a3fd164ac2ac9db9"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.3/zrk-0.3.3-x86_64-macos.tar.gz"
      sha256 "463fe6c477b96fd6840185c3c589b3a291db361ca249fc2cc772042b614a5628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.3/zrk-0.3.3-aarch64-linux.tar.gz"
      sha256 "23f05b6341646e9f679775a02b96d75597991aa52d7568cd1a34db88c89815b9"
    end
    on_intel do
      url "https://github.com/floatdrop/zrk/releases/download/v0.3.3/zrk-0.3.3-x86_64-linux.tar.gz"
      sha256 "034d3cb231bac8a23970e3ccaff8e4d6822ae568418764f756a7f77bd4deca07"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
