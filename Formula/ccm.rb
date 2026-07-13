class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.22.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.0/ccm-darwin-amd64"
      sha256 "eebb045a2127b168901283085d7faa0acfc7aa4dc02617d0ce3f3f6fab83e7da"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.0/ccm-darwin-arm64"
      sha256 "62b4b9a52a8a5f92696f51849126f6fd5269c637b1033e07cd530fc1ea0f144f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.0/ccm-linux-amd64"
      sha256 "51011159b48f77e32f0463559ddc7083f8b73e98ca85280f130482b1511e5c13"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.0/ccm-linux-arm64"
      sha256 "adfbdcc89282038b74a8bf48b8ca1a794b602e2af189e0f7d622ea3f4a939198"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.0/ccm.1"
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
