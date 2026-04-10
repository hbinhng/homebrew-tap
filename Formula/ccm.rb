class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.6.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.4/ccm-darwin-amd64"
      sha256 "8a065031a9e2cafe551b55dd30ec78d9cf79c261256c682d62c0637b5a09e895"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.4/ccm-darwin-arm64"
      sha256 "33e06135410db83d55135224b68e46b7acdce85cf491c67408a449a8fdad8acb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.4/ccm-linux-amd64"
      sha256 "49ad714de856e4269f7f561c22b74e2450b8fefd97fc577c367a9414431f81a4"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.4/ccm-linux-arm64"
      sha256 "4915ea7cd412c7660f837f7763a6b0231e7bfdad3b613dec8dd7b7019be1b451"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.4/ccm.1"
    sha256 "75687dacce6983ea4f849923b2475563a71b561916ec2cf70a3c07008381d0a7"
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
