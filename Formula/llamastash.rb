# typed: false
# frozen_string_literal: true

# Llamastash binary formula.
#
# The `stable` block ships prebuilt binaries from the GitHub release matching
# the formula's version. The `head` block builds from source via cargo for
# users who want pre-release commits (`brew install --HEAD ...`).
#
# Version + sha256 fields below are rewritten on every tag by the main repo's
# release.yml publish-homebrew job (direct clone+push). The bump.yml workflow
# in this repo is a workflow_dispatch-only manual fallback.
class Llamastash < Formula
  desc "Fast, keyboard-driven TUI for launching local llama.cpp models"
  homepage "https://github.com/llamastash/llamastash"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "llamastash"
      doc.install "README.md"
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llamastash --version")
  end
end
