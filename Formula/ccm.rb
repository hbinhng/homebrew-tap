class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.0/ccm-darwin-amd64"
      sha256 "04af4a91fbcd63404d0ee8b1d57eaad0fd7fa3221263ff52b768451af0fe2e50"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.0/ccm-darwin-arm64"
      sha256 "2422ce13209578314e99c0d3a64e5e0228a08998a541355138a5d7c5a84ff37d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.0/ccm-linux-amd64"
      sha256 "a9c3c88ae3c271fa905e788f57cb5b69dbd3bab40915588164e875a9fe062815"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.0/ccm-linux-arm64"
      sha256 "214396167cdd78b8088424f4f64c2a89e136180a6cedf76e7c8acaf30597d4b4"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.14.0/ccm.1"
    sha256 "4401078a9de47ec1316cb5c373b8e09cb8a5c76ec62503fe614fbbfa165f0426"
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
