class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.0/ccm-darwin-amd64"
      sha256 "adb4d7f1f71fdf94bde9278e4f19e132f35f011736c9e62a78326bdb18258605"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.0/ccm-darwin-arm64"
      sha256 "139765bec265b5b9d0e147c3f7c5ead3e03ff786b66f4b4ce85f4fb42c54bb2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.0/ccm-linux-amd64"
      sha256 "32e1384f0189baec42f27a12b5739f1d5cd29cd1bc2aeebd892a8a20b0b8e98e"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.0/ccm-linux-arm64"
      sha256 "ace00e4855f141514feb15b670f621231e36371180b13ef24bdb44f947456d48"
    end
  end

  def install
    binary = Dir.glob("ccm-*").first || "ccm"
    bin.install binary => "ccm"
  end

  test do
    assert_match "Claude Credentials Manager", shell_output("#{bin}/ccm --help")
  end
end
