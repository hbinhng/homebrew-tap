class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.2/ccm-darwin-amd64"
      sha256 "9fb0a5e82b178f952aa6fa8449aeeeea91492c7d956f49b02f0d96703bad8806"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.2/ccm-darwin-arm64"
      sha256 "36eee30521a9572b098cd6d163ed3e9d61e47999452978dea034ca1fea01958d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.2/ccm-linux-amd64"
      sha256 "951dce879b3919f2d5cb4e004be933487b5e51432db9d335701cc0cacc83f1ac"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.2/ccm-linux-arm64"
      sha256 "0d567940b9cad787a0576d3c81338f7926e2af2b92d8a0eebdc9f1b920d8ae3e"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.2/ccm.1"
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
