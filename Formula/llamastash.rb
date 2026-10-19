# typed: strict
# frozen_string_literal: true

# Generated from deployment/homebrew/llamastash.rb.template by
# deployment/homebrew/packager.py during .github/workflows/release.yml.
# Do not edit Formula/llamastash.rb in the tap repo by hand — it is
# overwritten on every tag.
class Llamastash < Formula
  desc "Zero-overhead, terminal-native local-LLM manager"
  homepage "https://github.com/llamastash/llamastash"
  version "0.9.0"
  license "MIT"

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b5dd41e7658941f69519327ebe6ab085428d3dc9f50aab55ff0c66e040494a8a"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "05c5f0400e4e4ef1a60cc5906edf03ab9d5ae9a0a5f3c3e1400ef65323d6b369"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b09a37b4a3f8dbda29e65de7bfd349619b9ed2ba8dc1f1a423d681c72d7cf71"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d74c643014b0d627c7966f88010945e01e313751c77a14c0cd0ae3cae4f380c8"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "llamastash"
      doc.install "README.md"
      pkgshare.install "LICENSE"
      ohai "You're done! Run with: llamastash"
      ohai "For runtime flags, see: llamastash --help"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llamastash --version")
  end
end
