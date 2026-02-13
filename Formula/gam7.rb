class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.01"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.01/gam-7.34.01-macos26.2-arm64.tar.xz"
      sha256 "649559b14af6f5162d28c299d543f49cc77297f404ce44c7707bdc2128dcdc4f"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.01/gam-7.34.01-macos15.7-x86_64.tar.xz"
      sha256 "0b09c120ba126c9563b0bba6e2e470e56f71a1d94386b355da5e4248304d0aa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.01/gam-7.34.01-linux-arm64-legacy.tar.xz"
      sha256 "2f57e05bbf94da6b9239488075c50fe97c5ec569e9b15181a6ac98ea4eb8aa5e"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.01/gam-7.34.01-linux-x86_64-legacy.tar.xz"
      sha256 "e6845d79c9ce929a7c49601eb3feefdb567b027acfdf8d90908bc606917355ef"
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
