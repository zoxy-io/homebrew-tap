class Zurl < Formula
  desc "Zero-allocation std.Io-native HTTP/1.1 client for Zig"
  homepage "https://github.com/zoxy-io/zurl"
  # No tagged releases yet; pinned to a known-good commit on main.
  url "https://github.com/zoxy-io/zurl/archive/b207f498f75aa89e966496330abfe30946d3a9e4.tar.gz"
  version "0.0.0"
  sha256 "34c2df4ccd4ed21f1e916497b5f00b32f89e3961074cdc3d793bf7aa35eae2a1"
  license "MIT"
  head "https://github.com/zoxy-io/zurl.git", branch: "main"

  depends_on "zig" => :build

  def install
    # Zig fetches build.zig.zon dependencies (hparse) into the global cache;
    # keep it inside the build sandbox instead of $HOME.
    ENV["ZIG_GLOBAL_CACHE_DIR"] = (buildpath/".zig-global-cache").to_s
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    output = shell_output("#{bin}/zurl 2>&1", 1)
    assert_match "usage: zurl", output
  end
end
