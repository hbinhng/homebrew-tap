class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.1/ccm-darwin-amd64"
      sha256 "d110b01ac6ae02ae5f57f02ae240c409d6e2eb219762a4540606ff7d2b4923f7"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.1/ccm-darwin-arm64"
      sha256 "1de61ad9a41a066ee25c3b331adb03e2d437ac7fb934535e162493e0d31432f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.1/ccm-linux-amd64"
      sha256 "9eea834b2bcf07aac7f74fe48d2eeaafa5cfaa37bc8beaa58d90c624cd421a33"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.1/ccm-linux-arm64"
      sha256 "94351a760253d820e332915ba0fcb6c3ff946573b100e176f61a0078b05b553e"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.1/ccm.1"
    sha256 "efeab287ded0e1a866687bc719591d944469b3ffb8fe98a96f264182364cd875"
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
