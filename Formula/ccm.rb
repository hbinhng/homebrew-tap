class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.1/ccm-darwin-amd64"
      sha256 "8fee8af094e0f43ca32f933a0b86359efbb797fd6e293b193097cb45433dbd59"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.1/ccm-darwin-arm64"
      sha256 "be39e1b722d91727bed17e100d686cc7f99cd3f8ed0f630ec6f661705d739293"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.1/ccm-linux-amd64"
      sha256 "2450edde62ff1281fde81839b79fecc929a423eb82cf42b316c3a9561b8db9be"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.1/ccm-linux-arm64"
      sha256 "105d6b6c5f427c583f3ddfadc5baf93abe2fc7609939a82b0bca596a6a9dd044"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.0.1/ccm.1"
    sha256 :no_check
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
