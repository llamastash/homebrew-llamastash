# typed: strict
# frozen_string_literal: true

# Generated from deployment/homebrew/llamastash.rb.template by
# deployment/homebrew/packager.py during .github/workflows/release.yml.
# Do not edit Formula/llamastash.rb in the tap repo by hand — it is
# overwritten on every tag.
class Llamastash < Formula
  desc "Zero-overhead, terminal-native local-LLM manager"
  homepage "https://github.com/llamastash/llamastash"
  version "0.6.0"
  license "MIT"

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8d9e49cc8b6eb5bf58de41e7caa1691ffcec7f93ed8dfaebd60d1ec30f75fcf1"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "344d391e903d0e95db0fd05491859104238f4f8e4d1f0ba00bae13abf4c5208f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bb177513ec3114372ef2fd75bf621498fed32297312fb4b161c9315b936616b"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1b18f8b0d1d76b6822a2fc45d4d5f0d551ea60642da22fd64be04ddbd942da2"
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
