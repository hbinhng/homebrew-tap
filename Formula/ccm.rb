class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.23.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.1/ccm-darwin-amd64"
      sha256 "fd2f1d97fecf21ee392e7289c8a5096f158d92b2307672b61fbb8a5d9a623ce9"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.1/ccm-darwin-arm64"
      sha256 "2940f35bc7d0e92137e726f5edab91e8a10905b2d72436b5bb596f21dd0b6db6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.1/ccm-linux-amd64"
      sha256 "0fe792b3a0cd79575c6e2088ddb40a98e9adbd4edd4203c4b23781cb2285a101"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.1/ccm-linux-arm64"
      sha256 "3836e9b0f329523b6970cfdc3ef24d18dc55679a7ad3c6be912b9ce1e43174e4"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.23.1/ccm.1"
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
