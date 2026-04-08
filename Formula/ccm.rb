class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.1.0/ccm-darwin-amd64"
      sha256 "9a33a4bcf1f649019f6b37dbf33ea68415bbb5756f726a3c00f5ce6ad9492586"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.1.0/ccm-darwin-arm64"
      sha256 "b6a099b999631852f3be54de68ff35ca05483081adccda71ddf56630ca60ef30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.1.0/ccm-linux-amd64"
      sha256 "b4e3f625de0096f93d68569d80b25c77ca04488955a19b62028abcbea86c55bb"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.1.0/ccm-linux-arm64"
      sha256 "9c4292d44e30188f50d8ea36eee5a791c06fdfede967660bfdd97cb25c48fbdd"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.1.0/ccm.1"
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
