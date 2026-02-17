class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.03"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.03/gam-7.34.03-macos26.2-arm64.tar.xz"
      sha256 "c2918aaac14ab4fddd55061def39eb201820c00c6375506d7c0240b20e5d32f7"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.03/gam-7.34.03-macos15.7-x86_64.tar.xz"
      sha256 "31b2b6d80478eca4f4692427d6284906d99e5aaca643128134e0384af9f8dfb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.03/gam-7.34.03-linux-arm64-legacy.tar.xz"
      sha256 "800a9fc82217c68d99b179dfb734a92d84d85fc0e51d52f93328deb76413ecaf"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.03/gam-7.34.03-linux-x86_64-legacy.tar.xz"
      sha256 "32be8e8738f3cc66ef7346d64648914a4cae00cd67a6961194a8d04aa694a305"
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
