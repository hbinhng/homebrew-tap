class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.23.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.0/ccm-darwin-amd64"
      sha256 "7554804fb18856e4b2b3c97f365a6fe6e3c94cca33d94b754ecfb50899bf1c62"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.0/ccm-darwin-arm64"
      sha256 "251805af28e0160ab36c391480890cc73e514f81a31b036db02242a6ca8e8721"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.0/ccm-linux-amd64"
      sha256 "5baa3c1080928b27006e613e1250d4e504c9702d9a44b3401d6abbb5a5b42b3d"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.0/ccm-linux-arm64"
      sha256 "03cba85e4ed3977db6d6c1b8f6e098735121a5e773f3be5ccf2e576e8e097dfe"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.0/ccm.1"
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
