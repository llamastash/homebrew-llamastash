# typed: strict
# frozen_string_literal: true

# Generated from deployment/homebrew/llamastash.rb.template by
# deployment/homebrew/packager.py during .github/workflows/release.yml.
# Do not edit Formula/llamastash.rb in the tap repo by hand — it is
# overwritten on every tag.
class Llamastash < Formula
  desc "Zero-overhead, terminal-native local-LLM manager"
  homepage "https://github.com/llamastash/llamastash"
  version "0.4.0"
  license "MIT"

  head do
    url "https://github.com/llamastash/llamastash.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1bed4fa31928332dc4cf42d02aa3dde9f2e23502bdb43eda42647ef80b7e7927"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "35a9b63470adbeade2e7a35acbf8f3aa144db202554797a6ebe0f790abee0ae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75f57067920cb22dbe1d3819e39bbc37f48b2481d4320480a49a226844ab3f6f"
    end
    on_intel do
      url "https://github.com/llamastash/llamastash/releases/download/v#{version}/llamastash-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff98902515b986dcd82fea72cc2e0e9456fb4ce990dc95ebef20cb98a27afc62"
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
