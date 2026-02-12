class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.00"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.00/gam-7.34.00-macos26.2-arm64.tar.xz"
      sha256 "972602b376882e628f66afa459ddb2dfe5b2fe4f51a324b8031092c37bb64d07"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.00/gam-7.34.00-macos15.7-x86_64.tar.xz"
      sha256 "7e5f66d2af0d4005438b5375edac2f8c29eeed2c083d663b0145c8b2ec52f789"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.00/gam-7.34.00-linux-arm64-legacy.tar.xz"
      sha256 "4d59842644954908ff9949c670ea79da42f104e51e0e9bb2b1c0f22c8016e084"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.00/gam-7.34.00-linux-x86_64-legacy.tar.xz"
      sha256 "90a5d599d075c340e183a8c97ee24b92dfd4565fced833b58782c5e509ea00c7"
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
