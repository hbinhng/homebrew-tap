class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.2.0/ccm-darwin-amd64"
      sha256 "35e02037286bd4465084c81adb2d8838620f9b846ebc55838e7bd8f3d39513ef"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.2.0/ccm-darwin-arm64"
      sha256 "63344eec95568cd91050885c340a16c8abfc8ff2e6b4712010579b26c3b03882"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.2.0/ccm-linux-amd64"
      sha256 "d9ed5df3cb0394d1fad784e760689eacc5a188b9f7363d537b653787667e68fa"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.2.0/ccm-linux-arm64"
      sha256 "e320a05f64cf151d06431df838fa9edcf78c89bc43ecffaf592141c561e393f7"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.2.0/ccm.1"
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
