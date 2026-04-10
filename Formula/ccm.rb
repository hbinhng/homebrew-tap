class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.2/ccm-darwin-amd64"
      sha256 "d6d2c39414a98e85cc38a64c023b3d877204da18af112eefb38f29d4d80dbb5e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.2/ccm-darwin-arm64"
      sha256 "1cda38c8450f2bb6812f867940503b2fe0b3470240bdb10f815fc51473048b12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.2/ccm-linux-amd64"
      sha256 "d0503ad7cb39c0d06cd5dd761b40edce37118649e732bee04760915590551847"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.2/ccm-linux-arm64"
      sha256 "31ab811bdadad09d51207f0bdd408cf1456bb6cd484845b12168da1900d1db91"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.2/ccm.1"
    sha256 "13987f51c255c36159ed6b399fe0885d2584c61c1ad3e38f96bd3de2b3a5789e"
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
