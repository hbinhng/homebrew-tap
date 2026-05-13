class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.20.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.2/ccm-darwin-amd64"
      sha256 "683de35c6efc58c0f5813cd31f43d923d59b0db9a02bbb7bd6da98c569cf405f"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.2/ccm-darwin-arm64"
      sha256 "9c67e382dec6f241fe0c09b6e53cdad6adb5b3055487edaefc2c5499bdccd3d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.2/ccm-linux-amd64"
      sha256 "a27139a9b65a3b6024a4eae65291e32d472d1f97eee600635feaeaf2effb4125"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.2/ccm-linux-arm64"
      sha256 "8829ac3e7788d28c6822c9580ce9000ad5177f36153537ae173067f531d3f109"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.2/ccm.1"
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
