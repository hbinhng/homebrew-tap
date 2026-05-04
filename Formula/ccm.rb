class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.12.0/ccm-darwin-amd64"
      sha256 "3f5ae76f3f1c3e91c550edde67c4c134346bba68c93a3232ae1a70322d5a4bef"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.12.0/ccm-darwin-arm64"
      sha256 "41b5f0f63946e4c6cd2e35a42466d742d027c01dfc2fa084ff48732337226c6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.12.0/ccm-linux-amd64"
      sha256 "ee6364d3231a95eae920d70b85edd05133fdc2006b494bd753890c8d722dbd4f"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.12.0/ccm-linux-arm64"
      sha256 "fd32827a2f3e2b673044fa6c838588d8035d4089fb8ec77b16c65d4bb61736c7"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.12.0/ccm.1"
    sha256 "fecfa2dbda8afb5f81fb2174351ea4a2208128b6f6d4b720e152aa9e17d373c9"
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
