class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.1/ccm-darwin-amd64"
      sha256 "ab7dea7bc198af21de50da5da63ddead2a7df394b9ddaa5709f652dbd6542c86"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.1/ccm-darwin-arm64"
      sha256 "60ce5028fbea61d24c1135e764b8810fd463d0bfcabe48f028fb60f25be0dc5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.1/ccm-linux-amd64"
      sha256 "597229b24c310c943c3c2743662d323e692e7128a7b7b4b2aa9d8c2ed67dc68c"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.1/ccm-linux-arm64"
      sha256 "b420637b0d7450465e8fb3fb76016cd391387230781087993695973c9e3070f8"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.1/ccm.1"
    sha256 "4277e2a1633ee68b0db93011a80dec564a48717da2bed6b1b0c69ec967b75a13"
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
