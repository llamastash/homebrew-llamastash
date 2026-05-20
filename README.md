# homebrew-llamastash

Homebrew tap for [llamastash](https://github.com/llamastash/llamastash) — a fast, keyboard-driven TUI for launching local llama.cpp models.

## Install

```sh
brew install llamastash/llamastash/llamastash
```

The shorthand `brew tap llamastash/llamastash && brew install llamastash` works equivalently.

## Build from source (pre-release)

To install the latest `main` from source instead of the pinned release:

```sh
brew install --HEAD llamastash/llamastash/llamastash
```

`--HEAD` uses cargo under the hood and adds ~90s to install time on a cold Rust cache.

## Upgrade

```sh
brew upgrade llamastash/llamastash/llamastash
```

## Uninstall

```sh
brew uninstall llamastash
brew untap llamastash/llamastash
```

## Reporting issues

Issues with the binary itself belong in [llamastash/llamastash](https://github.com/llamastash/llamastash/issues). Issues that are tap-specific (e.g., the formula fails `brew style`, the bump workflow drifts) belong here.

## How the formula stays up to date

`.github/workflows/bump.yml` listens for `repository_dispatch` events fired by the main repo's release workflow on every tagged release. The dispatch carries the new version + the four per-target SHA-256s of the release tarballs; the workflow rewrites `Formula/llamastash.rb`, lints with `brew style`, and pushes. No manual maintenance.
