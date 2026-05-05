class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.1/ccm-darwin-amd64"
      sha256 "50c0b35fb2a4fa578078fe0bf485e9ba557af95893e3a0cc6aa654735a0fa1f3"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.1/ccm-darwin-arm64"
      sha256 "cf26c9dd9608e2f80c091f299985bab1ffbfd5f955a5bb76f479eccfd26b0e67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.1/ccm-linux-amd64"
      sha256 "88472175f5b3ebf15f396fea345a6733be65b46f24e1a5acb18006ed99c79bda"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.1/ccm-linux-arm64"
      sha256 "cbb419bcb828fc4b5715245e4a4b2590f326b6b39d0329e04077c1daa78caae4"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.1/ccm.1"
    sha256 "0219719cf7376a4854f038812b3e79eec455864361862d9de147d170f7d9c350"
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
