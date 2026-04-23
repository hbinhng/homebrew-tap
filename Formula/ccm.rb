class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.10.0/ccm-darwin-amd64"
      sha256 "a92a9b24e9d497c1c77b7f713ed581d4e7d9359b5213946234ed8cd2d94f120e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.10.0/ccm-darwin-arm64"
      sha256 "7866a00728229a2fede8f006f9221331768e7ff4035f08fb875da4d8950dcb20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.10.0/ccm-linux-amd64"
      sha256 "6c7c48678c5b8294565dbf19239b67f8bcf558c89992e61b32a85607e3b1e89a"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.10.0/ccm-linux-arm64"
      sha256 "a5193c2f048b6e6868de08be5c193875363f4e649bdd0dcf8cf731a90a2f36b8"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.10.0/ccm.1"
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
