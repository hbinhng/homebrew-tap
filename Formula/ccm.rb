class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.0/ccm-darwin-amd64"
      sha256 "e57544fb50e72c9f637d0a713840d53cd9c7de5203298d15ebad88f23338ff33"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.0/ccm-darwin-arm64"
      sha256 "de5f23bdd41fe848882307694a6d448fda46cd62df7beaf165fe189274670e4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.0/ccm-linux-amd64"
      sha256 "0624820d7402f5e9e16f690264c15bbbcec3f9d4a04bb21c2e2e5a553d4b6093"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.0/ccm-linux-arm64"
      sha256 "f91cc8fa0e4c66b006b3f2c0a1973be4e9ab2521411b9b8f6e6f81c8659e1330"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.0/ccm.1"
    sha256 "82e9cfc6a4776c9c66704828f67b126b3d18f73415e29a1884c0ca4ded137e23"
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
