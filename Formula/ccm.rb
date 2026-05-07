class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.16.0/ccm-darwin-amd64"
      sha256 "de3294929cd0b417084fa4d0f4300ec83a62d1afafd6a97b576a2e1ade363c7b"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.16.0/ccm-darwin-arm64"
      sha256 "6240a82c8e83db2ee367b420d03817703b7f57f6cf33d6d03fe7cd7a4e83a2f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.16.0/ccm-linux-amd64"
      sha256 "c639f16505cec38f1af662839f5ce11810d8a83fa0c4f83d4054c9e14a4d9940"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.16.0/ccm-linux-arm64"
      sha256 "a9a3cc2bbb77d3fa3112116269af7932ffa64005061316790b507934335d0265"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.16.0/ccm.1"
    sha256 "a9fc489f2789bdc905bfb410b52db50ef3f7769b90e9ebf99981d0d906d9455b"
  end

  def install
    binary = Dir.glob("ccm-*").first || "ccm"
    bin.install binary => "ccm"

    resource("man").stage do
      man1.install "ccm.1"
    end
  end

  test do
    assert_match "Claude Credentials Manager", shell_output("#{bin}/ccm --help")
  end
end
