# homebrew-tap

Homebrew formulae for [zoxy](https://github.com/zoxy-io/zoxy),
[zrk](https://github.com/zoxy-io/zrk), and [zurl](https://github.com/zoxy-io/zurl).

## Install

```sh
brew tap zoxy-io/tap
brew install zoxy   # zero-allocation L4/L7 edge proxy (prebuilt binaries)
brew install zrk    # constant-throughput HTTP load generator (prebuilt binaries)
brew install zurl   # std.Io-native HTTP/1.1 client (built from source, needs zig)
```

## Formulae

| Formula | Source | Notes |
| ------- | ------ | ----- |
| `zoxy` | prebuilt release binaries from `zoxy-io/zoxy` | macOS/Linux, arm64 + x86_64 |
| `zrk` | prebuilt release binaries from `zoxy-io/zrk` | macOS/Linux, arm64 + x86_64 |
| `zurl` | built from a pinned commit of `zoxy-io/zurl` | no tagged releases upstream yet; `brew install --HEAD zurl` builds `main` |

`zoxy` and `zrk` each have a `.github/workflows/release.yml` in their own repo
that pushes here automatically on a tag, using a write-access deploy key
scoped to that repo (`<repo>-release-bot`, stored as that repo's
`HOMEBREW_TAP_DEPLOY_KEY` secret). `zurl` has the same workflow wired up and
will switch to this table's prebuilt-binary shape the moment it cuts a first
tag.

## Updating

- **zoxy** / **zrk**: automatic, via each repo's `release.yml`. To update by
  hand, bump `version` and the four `sha256` values from the release's
  `SHA256SUMS.txt`.
- **zurl**: bump the commit in `url`, recompute `sha256`
  (`curl -sL <url> | shasum -a 256`). Switch to release tarballs once
  upstream tags a release.
