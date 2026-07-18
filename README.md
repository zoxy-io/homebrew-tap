# homebrew-tap

Homebrew formulae for [zoxy](https://github.com/zoxy-io/zoxy) and
[zrk](https://github.com/zoxy-io/zrk).

## Install

```sh
brew tap zoxy-io/tap
brew install zoxy   # zero-allocation L4/L7 edge proxy (built from source, needs zig)
brew install zrk    # constant-throughput HTTP load generator (prebuilt binaries)
```

## Formulae

| Formula | Source | Notes |
| ------- | ------ | ----- |
| `zoxy` | built from a pinned commit of `zoxy-io/zoxy` | no tagged releases upstream yet; `brew install --HEAD zoxy` builds `main` |
| `zrk` | prebuilt release binaries from `zoxy-io/zrk` | macOS/Linux, arm64 + x86_64 |

## Updating

- **zrk**: bump `version` and the four `sha256` values from the release's
  `SHA256SUMS.txt`.
- **zoxy**: bump the commit in `url`, recompute `sha256`
  (`curl -sL <url> | shasum -a 256`). Switch to release tarballs once
  upstream tags a release.
