class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.33.02"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.02/gam-7.33.02-macos26.2-arm64.tar.xz"
      sha256 "ca57890f98834603dfe781985ec97470d343b942e3812f3918a9c20e8a7e9a4e"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.02/gam-7.33.02-macos15.7-x86_64.tar.xz"
      sha256 "17bf442d0bbe4af94a4d77a5369fcbfc2c4897ae9d0a21ade26236ec5f6ae597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.02/gam-7.33.02-linux-arm64-legacy.tar.xz"
      sha256 "11631b9967b874c51cb8706ff2e5bdc9e09e07663d06ab2d7775d2b522f95291"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.02/gam-7.33.02-linux-x86_64-legacy.tar.xz"
      sha256 "0c0af8a28c446542487fea119c5341829e3e825cf8156f0cad6a7cd503b919dd"
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
