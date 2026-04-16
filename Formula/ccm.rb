class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.1/ccm-darwin-amd64"
      sha256 "e4e306d15eedc1b2eba18a3babd0ec833be1588a63aaff4058c0688e65c46281"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.1/ccm-darwin-arm64"
      sha256 "0dc2d1f89836859b93b51994a9da4288496147903e9b807b71c4a51fccf38610"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.1/ccm-linux-amd64"
      sha256 "d80a9dce269156f35a7ebd64dece691ed614aca2505bf4bd017f0835c362e8ab"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.1/ccm-linux-arm64"
      sha256 "49268209cfc98162e848cef4e6eb5ab5c59545fba2833ed9fe42be630f80a2d3"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.9.1/ccm.1"
    sha256 "6b85cb28f53eec3bc5a1384996779de3e8c6bf405f60e1301448a723a02d7f0a"
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
