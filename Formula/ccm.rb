class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.7.0/ccm-darwin-amd64"
      sha256 "d814919d770bd08449edf2f3f702434c52caf2b38fb00dd893352e77685cf3bc"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.7.0/ccm-darwin-arm64"
      sha256 "3e22e25e81ade94abd0ed4882e707b1b9cc5d7f07b0a4fcf4be0337f56f0a6ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.7.0/ccm-linux-amd64"
      sha256 "0203f0b5a8f86375ca75a15ba7330a9f4b7b1362685870aa699915eb82f4c0ed"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.7.0/ccm-linux-arm64"
      sha256 "cb9ad47d42ff62845c6179a61d64e63ba4bfa084242d661e8f19f32cd0452df2"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.7.0/ccm.1"
    sha256 "37f2e7a7d8bd7fb8e1252d2c80035fd4cd3163c812937cef0a63dce7a2623500"
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
