class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.08"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.08/gam-7.34.08-macos26.3-arm64.tar.xz"
      sha256 "af5af940858a061f30528b781a4612d59d162c7b690dc10c154c6aec883fc2da"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.08/gam-7.34.08-macos15.7-x86_64.tar.xz"
      sha256 "ef0bd2047ecc7ee11690e3f8d9482f38e505ed580a5dea1897fd1f4583d0111a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.08/gam-7.34.08-linux-arm64-legacy.tar.xz"
      sha256 "24f054a2c43c73faa7c033d7924d655136bade6803a1d89c52f647f845c611d1"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.08/gam-7.34.08-linux-x86_64-legacy.tar.xz"
      sha256 "82c072c24d3e1f7ca1b61ae65a4edf50557b6a66b4929b4b7409e38841e17dcd"
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
