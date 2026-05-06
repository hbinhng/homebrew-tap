class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.0/ccm-darwin-amd64"
      sha256 "24167f46016726cadc67c48d8d648d8f0287b0e430d9a6e4430e9fc6e190de60"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.0/ccm-darwin-arm64"
      sha256 "972f244e541ccdffef130a2f4d7b5433d37dedc0d43e29572750b772aa73acbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.0/ccm-linux-amd64"
      sha256 "b8bfffe326dcd61f0f29309df103f0b1425af7f2a1b89acd7584c3c4db12b70f"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.0/ccm-linux-arm64"
      sha256 "9b837f305bf361d726ed89a3535c69770af8ff62d18c041b8e22720b17ded51e"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.0/ccm.1"
    sha256 "26ed83d464faf871726ada613a3f8150869cffdae2393f8b70815c74505043d1"
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
