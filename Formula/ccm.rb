class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.18.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.18.1/ccm-darwin-amd64"
      sha256 "495314e6e3246c981e0317dcb0c5c48de62cf4c46642ab6329daa219e009f885"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.18.1/ccm-darwin-arm64"
      sha256 "340228f4b540a6d2517a9b770a9eefbeea58526b99b1b6c05760ebffd8bb3a18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.18.1/ccm-linux-amd64"
      sha256 "8345634c4e70d159f3193c798ec39f1ddc9f5f90c2c7eb96b57e9e50904af758"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.18.1/ccm-linux-arm64"
      sha256 "8dceda8c3a7c20262c10d9e132738e8aa2d90a546f44a517cb48874d7982b83c"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.18.1/ccm.1"
    sha256 "9f715808f25fa89555ec643884b1a996894bf9c9b4623216b44a683c6b15fa14"
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
