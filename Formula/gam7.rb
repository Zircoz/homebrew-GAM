class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.02"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.02/gam-7.31.02-macos26.0-arm64.tar.xz"
      sha256 "1053ef4ea6904a29c7e98a4b0047da99633ca7e9c3c2901addba8df761ca8642"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.02/gam-7.31.02-macos15.7-x86_64.tar.xz"
      sha256 "d5cbc4cb8bdb66deabfbcc4cf23d491b4be8c2264d16651b9dda90bad89bb793"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.02/gam-7.31.02-linux-arm64-legacy.tar.xz"
      sha256 "36049037685fb47ebba774d47491167a402bc2e80915706fe044da0633fa5e58"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.02/gam-7.31.02-linux-x86_64-legacy.tar.xz"
      sha256 "3af322166a9d1df7b334f97362b50a4b7ecb3c13d76504d41c2ee15cccd2a6f1"
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
