class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.2/ccm-darwin-amd64"
      sha256 "bf1213f4e10ff588aefa91aebf9e703c6596075b3efa34a04fe735b269625f91"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.2/ccm-darwin-arm64"
      sha256 "90b7286fc632e6e29b0e387997779eb5cfb191ffe97119085a29e5a59d1eacdd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.2/ccm-linux-amd64"
      sha256 "a6702e0a39f74c6cc9daa9db648b33a5f592ac2be071e4b1452afa4c54718de2"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.2/ccm-linux-arm64"
      sha256 "793128e440d03030930258cc8f62fc929b3a1b7600130b6f74e4ab5df7d9b6b8"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.2/ccm.1"
    sha256 "d79dc29a6176473e260efb8e897ab95ed2a28cc7b487965af33313a118ea02d2"
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
