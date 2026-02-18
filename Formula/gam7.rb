class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.04"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.04/gam-7.34.04-macos26.2-arm64.tar.xz"
      sha256 "8b6c16806272ebbc4e7a84c06083ae465454a4d76a918acdd8a3dc09f6eac099"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.04/gam-7.34.04-macos15.7-x86_64.tar.xz"
      sha256 "7461db98c664f3669fc37cfb7c4010102ed958b7c6f6c1fa0fd872040984b795"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.04/gam-7.34.04-linux-arm64-legacy.tar.xz"
      sha256 "8d4051b2d3e79b0c613f652dd86a8f780fbdaad4b6cb75fed04b5f1596767d49"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.04/gam-7.34.04-linux-x86_64-legacy.tar.xz"
      sha256 "9dbd350e335228c4c1e4944a43652f66a3acf1003a29f3a77f0b29a882168d76"
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
