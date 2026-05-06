class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.1/ccm-darwin-amd64"
      sha256 "ef8db706a0dc113f7e5dc32d38df0730f62e20b4cf73397abcb96ed1ed0bc4b1"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.1/ccm-darwin-arm64"
      sha256 "0406fdcd77661f07b762010b563394435e8b0341987886b5719b53d25d675074"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.1/ccm-linux-amd64"
      sha256 "ff1434a8931dfeea8cc3f53e9ca94c73fa6cfbf77af58a99be8eb4acba0ef021"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.1/ccm-linux-arm64"
      sha256 "76e6080939fd74c4e6e873899dcb73b5fdd08c94593a256a8ea73eb586fd257c"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.15.1/ccm.1"
    sha256 "225658345f1d03e6daf5cdf9b16e2aebd15959a764d5f8220b6889915bf2c985"
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
