class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.22.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.1/ccm-darwin-amd64"
      sha256 "029cc1dc1ec68459ccd956bf81e49a2cac1350047fa75515290d6a869e4a5bbf"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.1/ccm-darwin-arm64"
      sha256 "285732fcbaf07f521a5ef0a00d4a3e9970facb2d2ceb7920c6c0ff1956443467"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.1/ccm-linux-amd64"
      sha256 "07a9a82ac76580df4ce10935c817cf5fd036af9332fe8c6a0311c55cd91172fd"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.1/ccm-linux-arm64"
      sha256 "c3482418d0c1a74a27fe3e6393e572dd1fc4a0c4ff96724b94e51a635fcfb69b"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.22.1/ccm.1"
    sha256 "812de74824fa34d9d93fed918950f9d43731ab0e45c2dcd63869caf5c806a81b"
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
