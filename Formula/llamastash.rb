# typed: strict
# frozen_string_literal: true

# Generated from deployment/homebrew/llamastash.rb.template by
# deployment/homebrew/packager.py during .github/workflows/release.yml.
# Do not edit Formula/llamastash.rb in the tap repo by hand — it is
# overwritten on every tag.
class Llamastash < Formula
  desc "Zero-overhead, terminal-native local-LLM launcher"
  homepage "https://github.com/llamastash/llamastash"
  version "0.0.5"
  license "MIT"

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ac1e6790ea24cef1019b96c73a2f1337de29e11022179b5b72a5cf17e50e85d2"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ba663ad0748151e314df50de7dac447569c3ada4987522b738d99feb4dd60d96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b143848ce98a39cc3b1804d17fa047cb4b60f88985488a6e520328bbcc8b23e"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e34166eddb1ae140b10aa6e422c14464c9b7aec49dbba37268d9dc240446e2c9"
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
