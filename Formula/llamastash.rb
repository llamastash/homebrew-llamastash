# typed: strict
# frozen_string_literal: true

# Generated from deployment/homebrew/llamastash.rb.template by
# deployment/homebrew/packager.py during .github/workflows/release.yml.
# Do not edit Formula/llamastash.rb in the tap repo by hand — it is
# overwritten on every tag.
class Llamastash < Formula
  desc "Zero-overhead, terminal-native local-LLM orchestrator"
  homepage "https://github.com/llamastash/llamastash"
  version "0.10.0"
  license "MIT"

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ee2910c96b3ae2ba8e72d8d8c63b36a6c324867b296bfed2e1c9ef16c34830ba"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1a7367dfdc0cb3d6e47c8bb51bf17379296cc2c4899c274dd1603180bad6db39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3ddc78be01ddd218cf380c1126b9bbee4ea4b00e93255bd2633fe0988c405a4"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eea1b598edd1e856ddb8cf44ef78555b997b278986b63df7ce59dcd09ef5508a"
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
