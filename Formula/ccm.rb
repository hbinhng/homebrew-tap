class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.19.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.0/ccm-darwin-amd64"
      sha256 "f11d5482e38cdb3d431528febd39a59facee9795f16d974377c891269c3bd60e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.0/ccm-darwin-arm64"
      sha256 "82eac93bc113d3e570fd825bc4f3315b1bf662f31cb781f879966f466ca4ffbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.0/ccm-linux-amd64"
      sha256 "fb3a9d4e8772fdf485524f6e3370f4fdf9f18a77df341263ed3b5c10a0f649f3"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.0/ccm-linux-arm64"
      sha256 "43160def2a259780b8f7c819a98567703829d3c3a8b27384a769a877b58363a4"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.0/ccm.1"
    sha256 "f5f0ca72fa6787fbc8c3c744b7c077e2cca99a87667930a822a5ecda173e36cd"
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
