# homebrew-llamastash

Homebrew tap for [llamastash](https://github.com/llamastash/llamastash) — a fast, keyboard-driven TUI for launching local llama.cpp models.

![Logo](https://raw.githubusercontent.com/llamastash/llamastash/main/assets/logo-h.jpg)

**Zero-overhead, terminal-native `llama.cpp` launcher.**

A fast TUI **and** CLI with init wizard for launching local LLMs via [llama.cpp](https://github.com/ggml-org/llama.cpp). One Rust binary that's a TUI, a CLI, a daemon, and an OpenAI-compatible proxy. Zero overhead vs raw `llama-server`.

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
