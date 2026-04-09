class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.0/ccm-darwin-amd64"
      sha256 "537170afb075f698aed160386bb60bac5a9a7b87ab28b5382f14e914f4c55142"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.0/ccm-darwin-arm64"
      sha256 "2013ef086b32ba5a0e1eb35d78c3f139c5caedb5cb511f232d0c2ee7ff2c3c15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.0/ccm-linux-amd64"
      sha256 "fbbbd61fefede718a8447b68bee9536b6b7690a43a4051de7a0a3ea684fa243b"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.0/ccm-linux-arm64"
      sha256 "29e2f4751440e58a41028e03b4bcd14f32b2f906537d3291a7fdf0f147f853a8"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.0/ccm.1"
    sha256 "46654f084c32a91f90710e0ae155794cabfc54bcfe58b708ca5180c905e24c01"
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
