class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.19.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.1/ccm-darwin-amd64"
      sha256 "6c012b7f6c0fb46d38c42d6ca1086bde682c42113b00794ddbeef055f036ca8e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.1/ccm-darwin-arm64"
      sha256 "b128c457f5d7395eba34d4a243a420249d5bab82d4df2149a47621a0aaae1457"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.1/ccm-linux-amd64"
      sha256 "5ad09fc44d7ced299b79fb31ee8d70cc0881070d132d2479a6eda4e45fb306fa"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.1/ccm-linux-arm64"
      sha256 "15f2f52595a91613bda20a02975262f58413ab8503ccdeb19ef6cff90eeff250"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.19.1/ccm.1"
    sha256 "f5f0ca72fa6787fbc8c3c744b7c077e2cca99a87667930a822a5ecda173e36cd"
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
