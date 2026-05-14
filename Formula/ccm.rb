class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.21.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.0/ccm-darwin-amd64"
      sha256 "24cb9fceacdfcd4a96799ab31fa256c057f1fa19ae56aa107a42a6ce1af61281"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.0/ccm-darwin-arm64"
      sha256 "a0118923ca1ac7f452de88280f011eb26343a9eb6023098a3de9aa96a10dcd66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.0/ccm-linux-amd64"
      sha256 "1ca9fe21fb6c1d572e4fcb13a32e4a2c51fc88b1e1132c02b6a8c82916c88893"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.0/ccm-linux-arm64"
      sha256 "9fcb8161ad2d9c7040d3f5bcbd1fe50c940b9f9bfbe96b26f1a57346364c7cb1"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.0/ccm.1"
    sha256 "e72bd25e9c9c4ff8413a534fa261ca55c77d36a3ec53d69dc839688fb5ad7c8a"
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
