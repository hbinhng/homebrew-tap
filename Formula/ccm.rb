class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.22.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.2/ccm-darwin-amd64"
      sha256 "b90a2fd987d4244079be9884dfdcc0a4ec1e1ea27047b5c46d78ffb58421bd5b"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.2/ccm-darwin-arm64"
      sha256 "8b8b65f26fd7709835ee9c716591bc661cf0d6822d652d50e539721d1d6df321"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.2/ccm-linux-amd64"
      sha256 "e322b3786518cafce1dbf71e75e10c23ae1b7d4642657b71ec156bba1344fda2"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.2/ccm-linux-arm64"
      sha256 "dd94f44c92f7d30ea8740326a91a3cfc31927735894b54c516dbade85bcebc0b"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.2/ccm.1"
    sha256 "812de74824fa34d9d93fed918950f9d43731ab0e45c2dcd63869caf5c806a81b"
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
