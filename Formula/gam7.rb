class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.04"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.04/gam-7.31.04-macos26.0-arm64.tar.xz"
      sha256 "4cef6699cfd75b3b3f6ae926f099a2af76f6feff09592fc1b1cad69ac1482012"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.04/gam-7.31.04-macos15.7-x86_64.tar.xz"
      sha256 "5b9b8ab2ab433be3ad523eb020e4324ca13417c02172916aaafc85bd44e2bd57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.04/gam-7.31.04-linux-arm64-legacy.tar.xz"
      sha256 "5b8f925a7e93a724d7ff536ec6a3bf0ee4492751e4264c54b227589854aa0f71"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.04/gam-7.31.04-linux-x86_64-legacy.tar.xz"
      sha256 "5e30675a369d1aa44a6b6aade4d48a45f75ae1ac27101c4b2e263a328db73388"
    end
  end

  def install
    # The tarball extracts to a directory named 'gam7'.
    # Homebrew automatically cd's into that directory if it's the only one.
    # We install all files to libexec and link the binary.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gam"
  end

  test do
    system bin/"gam", "version"
  end
end
