class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.20.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.1/ccm-darwin-amd64"
      sha256 "ce33efb2d72c92fa9235aaec5ae8b723efda93eb9c7040052d10a41f8bc7b2e0"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.1/ccm-darwin-arm64"
      sha256 "4dd6a755a36c99e2feec97a708e04a68e0df3c7aa0adb6b391b6e5d78ded83b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.1/ccm-linux-amd64"
      sha256 "4bbd1a52f4d41ff2fb6eb453e70c870577af1bcf180f42bc8c5a18590d5fb504"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.1/ccm-linux-arm64"
      sha256 "a381db0f1d8f4768f475be7fc59a047a6d6a828b6783f6747060b2aa26ce8866"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.1/ccm.1"
    sha256 "e370a33925cffa92017d7b37e0842b768b21f77ccd182e4142dd0dea029627fa"
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
