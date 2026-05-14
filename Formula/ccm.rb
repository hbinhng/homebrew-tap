class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.21.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.1/ccm-darwin-amd64"
      sha256 "74b9d925acb610ff53072f5b1eb21b143cbb381a22c3632e761fd803638f28b1"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.1/ccm-darwin-arm64"
      sha256 "6497e210407e2b5010b84c013941bcfef5ba615ba7b83d51b5d692d6b060e955"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.1/ccm-linux-amd64"
      sha256 "6cc1078b9f1f59d98d9fa92bef93066c79d1b60148999c0b6345860a53937b99"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.1/ccm-linux-arm64"
      sha256 "9f33d9bdd0ca369f2ebec457ba23eb79026da889f7732be9ec76020efb7c871d"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.21.1/ccm.1"
    sha256 "e98aaa854307a17efaaabc1352a111a8d091e3e24645577a3c8ff3e583001018"
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
