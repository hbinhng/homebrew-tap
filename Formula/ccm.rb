class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.13.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.1/ccm-darwin-amd64"
      sha256 "1e577abf20fe731c1b4bafc883a2c165ded5f5e539a1fd79f40f93055063f9d6"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.1/ccm-darwin-arm64"
      sha256 "dd3dc8b61c50a80108275e8f22e7a89e98d60640ab47622ccee952e7f8ca9a42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.1/ccm-linux-amd64"
      sha256 "48ccf000a89e93b7fb66c60dc28abf3ca1180ac3c8eea76daad843d90cd29976"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.1/ccm-linux-arm64"
      sha256 "5448ab01ce61285ab0c76c5eee0e33ebf4a97537aba7c2720284e0ac25cf49cb"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.13.1/ccm.1"
    sha256 "2135c90846bf9c4f3ea1d019fb44080a25e26dbbbb793166a04b0c398510ddc5"
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
