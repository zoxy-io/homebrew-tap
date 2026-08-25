# homebrew-tap

Homebrew formulae for [zoxy](https://github.com/zoxy-io/zoxy),
[zrk](https://github.com/zoxy-io/zrk), and [zurl](https://github.com/zoxy-io/zurl).

## Install

```sh
brew tap zoxy-io/tap
brew install zoxy               # zero-allocation L4/L7 edge proxy (prebuilt binaries)
brew install zrk                # constant-throughput HTTP load generator (prebuilt binaries)
brew install zoxy-io/tap/zurl   # std.Io-native HTTP/1.1 client (prebuilt binaries)
```

`zurl` needs the fully-qualified `zoxy-io/tap/zurl` name: `homebrew/core` already has
an unrelated `zurl` (fanout's ZeroMQ-based HTTP/WebSocket proxy worker), and a bare
`brew install zurl` resolves there instead, pulling in `qtbase`/`zeromq` and five
other dependencies that have nothing to do with this one. `zoxy` and `zrk` have no
such collision.

## Formulae

| Formula | Source | Notes |
| ------- | ------ | ----- |
| `zoxy` | prebuilt release binaries from `zoxy-io/zoxy` | macOS/Linux, arm64 + x86_64 |
| `zrk` | prebuilt release binaries from `zoxy-io/zrk` | macOS/Linux, arm64 + x86_64 |
| `zurl` | prebuilt release binaries from `zoxy-io/zurl` | macOS/Linux, arm64 + x86_64; name collides with `homebrew/core/zurl`, see above |

Each of `zoxy`, `zrk` and `zurl` has a `.github/workflows/release.yml` in its
own repo that pushes here automatically on a tag, using a write-access
deploy key scoped to that repo (`<repo>-release-bot`, stored as that repo's
`HOMEBREW_TAP_DEPLOY_KEY` secret).

## Updating

Automatic, via each repo's `release.yml`. To update any of them by hand,
bump `version` and the four `sha256` values from the release's
`SHA256SUMS.txt`.
