class Ccm < Formula
  desc "Claude Credentials Manager — manage multiple Claude OAuth sessions for Claude Code"
  homepage "https://github.com/hbinhng/claude-credentials-manager"
  version "1.6.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.3/ccm-darwin-amd64"
      sha256 "d7e550d35ba4924fdbf64a8e25ae89568edce1c128917ce90d9cec5a0ae2e181"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.3/ccm-darwin-arm64"
      sha256 "022a3b8275dde763f6dd241069434f4ed06d35aee457adddd47e8b4436570894"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.3/ccm-linux-amd64"
      sha256 "186dc8594418c4165170db88756816e2b443a48d497e21dc298eea300e8bf0c7"
    end

    on_arm do
      url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.3/ccm-linux-arm64"
      sha256 "b1e7db9a04b88e1660c991d3bd2eba1c1c4ac69ef498aca8c523949584ff0a4b"
    end
  end

  resource "man" do
    url "https://github.com/hbinhng/claude-credentials-manager/releases/download/v1.6.3/ccm.1"
    sha256 "ca70f1dc0caad4b85d68e6c85317c73f2078e0dfc845bb8bf028bc1ab4bc887d"
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
