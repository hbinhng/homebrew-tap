class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.0/ccm-darwin-amd64"
      sha256 "516185a714a89d9b063cad04cad9082bd73bae7450a983217b69f61213a86d1f"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.0/ccm-darwin-arm64"
      sha256 "93cc1a368a48a5bfcba80fe36178d0bb577cbdc6cec8c51dc868c65bc43aa0ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.0/ccm-linux-amd64"
      sha256 "37294f7ce1d34d5267c24e6671d28673691abce907057dd78c57f09fbf532601"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.0/ccm-linux-arm64"
      sha256 "1f13b878bbff136cc94dc741e04c80684e8f9589968a55887ed96b5be3d977db"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.0/ccm.1"
    sha256 "a07cdeac58f04ef46fd52d26bf37544cf19d3ee2d6d37af29fc9cda023ce0061"
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
