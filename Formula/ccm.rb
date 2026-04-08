class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.3.0/ccm-darwin-amd64"
      sha256 "3016bc66a567b643d91fbd11718c3e85bccb99f1a2d147545ee763c6e4981e88"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.3.0/ccm-darwin-arm64"
      sha256 "5796abf3e8ec8a4ab33b3f9c667b6d6cb1228c21e2703faa7900011e0e78f783"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.3.0/ccm-linux-amd64"
      sha256 "d858b3c8f4d8bb19f77cf1c0d415dd50eae8e25ac1593eec52405e79b8884a3c"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.3.0/ccm-linux-arm64"
      sha256 "888699ff867268e5d537a014893758bde335fa731a7282627aef245566ffb67d"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.3.0/ccm.1"
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
