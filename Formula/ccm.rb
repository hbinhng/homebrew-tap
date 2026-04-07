class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.4/ccm-darwin-amd64"
      sha256 "7af6c5f29662aa807192074a1e8a39d8156373d0c3addcf3f11c9eac644bc985"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.4/ccm-darwin-arm64"
      sha256 "f83c258b209cf782598a88421806eaf5776fd1e6acf6bf32e383637f7a39734d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.4/ccm-linux-amd64"
      sha256 "3bab1b46f92da15fff93c134b0200cfc09a973860ded8114a26a6f37afffcd58"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.4/ccm-linux-arm64"
      sha256 "e724ba8fc50b95b71bfedffcab5967cade1c2f73c42a75b490951a90739adeb3"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.4/ccm.1"
    sha256 "78c69fb9baa42cf6079f07d42d86b3ff0fea6602b21632b18b58a28bbd563639"
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
