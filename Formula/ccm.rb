class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.1/ccm-darwin-amd64"
      sha256 "4298fe289b30855ac9f65a928e87c4c2f99741796105df33fc53921556f27f91"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.1/ccm-darwin-arm64"
      sha256 "8dce082ae2379ce16b6fda149d30ade66e217ffdd473b67673d656120bf31b6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.1/ccm-linux-amd64"
      sha256 "b3ae72eab28e5821933ac196813d05337d314549cd5c4bb000b7556c13c7a4ca"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.1/ccm-linux-arm64"
      sha256 "a4c91a9dfc937a40142a9a6874fb73bac700e9049eefab9078301c8f2121a93e"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.5.1/ccm.1"
    sha256 "46654f084c32a91f90710e0ae155794cabfc54bcfe58b708ca5180c905e24c01"
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
