class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.11.0/ccm-darwin-amd64"
      sha256 "3a7d7bbd1de3afd17f7e1c6765dff97f631e3fe6d7c67ba6b1f1560b5cd02d8a"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.11.0/ccm-darwin-arm64"
      sha256 "ea5c508aed1efedf3360122f151ec6bb6467bd4bdbd62cc84fd8fd37b0e2da78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.11.0/ccm-linux-amd64"
      sha256 "417554ebd396f90243615e20bd5bfe739c8b520a541ccbac93f1b428b3daad9c"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.11.0/ccm-linux-arm64"
      sha256 "152aba47f9b124ce19aeef2d1477cca1248714d9139d723912528c11a9aaa84b"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.11.0/ccm.1"
    sha256 "c5442b01cfb19f7bebaf5a6918e91ac42e5cf915446bea19e4b01038c3debb3f"
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
