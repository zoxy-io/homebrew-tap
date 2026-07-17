class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://github.com/zoxy-io/zoxy"
  # No tagged releases yet; pinned to a known-good commit on main.
  url "https://github.com/zoxy-io/zoxy/archive/2ae9ee9e8466b8f2a28a30859ba24c1f401f32ef.tar.gz"
  version "0.0.0"
  sha256 "008b25c155d849ae446a39609ae64fd6c52cf7b7cb2b459a4a3a3876a1afce1d"
  license "MIT"
  head "https://github.com/zoxy-io/zoxy.git", branch: "main"

  depends_on "zig" => :build

  def install
    # Zig fetches build.zig.zon dependencies into the global cache; keep it
    # inside the build sandbox instead of $HOME.
    ENV["ZIG_GLOBAL_CACHE_DIR"] = (buildpath/".zig-global-cache").to_s
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    output = shell_output("#{bin}/zoxy #{testpath}/missing.json 2>&1", 1)
    assert_match "cannot read config", output

    (testpath/"zoxy.json").write <<~JSON
      {
        "listeners": [
          { "bind": "127.0.0.1:0", "cluster": "origin" }
        ],
        "clusters": {
          "origin": { "endpoints": ["127.0.0.1:9000"] }
        },
        "timeouts": {
          "connect_ms": 5000,
          "idle_ms": 60000,
          "drain_deadline_ms": 10000
        }
      }
    JSON
    pid = spawn bin/"zoxy", testpath/"zoxy.json"
    sleep 2
  ensure
    Process.kill("TERM", pid) if pid
  end
end
