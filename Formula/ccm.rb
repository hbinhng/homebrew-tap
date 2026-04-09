class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.0/ccm-darwin-amd64"
      sha256 "14bfe4b9199882aa916a290817438ce75a3b63c75bd47733e9c4d29600b33678"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.0/ccm-darwin-arm64"
      sha256 "866877d6f41df0994b1e59200733f48d769c71445faa2ae9533de2c5f14ef9df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.0/ccm-linux-amd64"
      sha256 "0ec6ccec31a8db2c5448e72eb5f56445e1e88d6cba9d619e0093c2580f0a54ee"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.0/ccm-linux-arm64"
      sha256 "581492acef0651e314bdc4faa04af0da91047c5444a1c82cfb7eb9311f025248"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.4.0/ccm.1"
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
