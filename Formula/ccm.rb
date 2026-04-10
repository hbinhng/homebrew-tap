class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.0/ccm-darwin-amd64"
      sha256 "2580e823cd0a6dc61e1d07b1bfc7c92294065a75b8eeca0ea1955ada7785bb39"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.0/ccm-darwin-arm64"
      sha256 "c5013843c4675b9b45fc2bac170f5f244912ba6a3fbfe4d2d5012a1905fd1ee7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.0/ccm-linux-amd64"
      sha256 "2c1dbc299fc8c29f035407d97506b01556196da1fb4a9f9df478f7d1bb1c6e2e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.0/ccm-linux-arm64"
      sha256 "ee826d7d02ed446e4143c9a509b12f2f6f14ea717be99907dbef5bf2c269f0d3"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.0/ccm.1"
    sha256 "415a1bba79a08497a67eb1159eabbde2ead9e4f63e4f4fe83709c352a32dc953"
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
