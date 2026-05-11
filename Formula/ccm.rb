class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.20.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.0/ccm-darwin-amd64"
      sha256 "c9e374efd6f1bc82a5c0e5377f42da641d45d7aba0a0b8b9594c85d2a42018e2"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.0/ccm-darwin-arm64"
      sha256 "0c0c0c962a0b759a3208d1a242a59a192de6ff92ac5067104ee84cbcd4bbbc3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.0/ccm-linux-amd64"
      sha256 "c9b7c54a48e25487a411051512af38038a1823842d9273f2ed4e90d5ca6b3e1a"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.0/ccm-linux-arm64"
      sha256 "fab24311fde9257eb5429a748e6abd7db499be3d38ecaf2163997aa53d701827"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.20.0/ccm.1"
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
