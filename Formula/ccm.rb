class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.8.0/ccm-darwin-amd64"
      sha256 "e62430cc98207bdde31dfeb009e67bcc516131d9bc4672580fd08f021dfa3636"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.8.0/ccm-darwin-arm64"
      sha256 "fca1dbeff014b3ba9d88716bdd17816a1925874b7e2a172aa09eebd40e9cfa3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.8.0/ccm-linux-amd64"
      sha256 "131c6588b92bb4d11859c3be39dad69bbb0c6cb584491511196ae77766c76146"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.8.0/ccm-linux-arm64"
      sha256 "4f6164d1e20f6936fbb2c75acf590f37705dff77018b0ff0ce3b536c6cfbbd09"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.8.0/ccm.1"
    sha256 "3aff41fa533368fdf67968a3d4a2fb6f7bd8233595246c02071e51c080b6b3ed"
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
