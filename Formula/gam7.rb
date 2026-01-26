class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.03"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.03/gam-7.32.03-macos26.0-arm64.tar.xz"
      sha256 "bbe831a6ef56e5d305fd812a9e1350c17ab61622eec5e0d2cf2657d046dab138"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.03/gam-7.32.03-macos15.7-x86_64.tar.xz"
      sha256 "e3a6fe077f9674fdb0c5f7218e21894e3dc447d556a18367328e6623a0ef0fee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.03/gam-7.32.03-linux-arm64-legacy.tar.xz"
      sha256 "32326a525e55264c50082a61a0105a7b388f4fe2456d8882c2afc7528f55708c"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.03/gam-7.32.03-linux-x86_64-legacy.tar.xz"
      sha256 "d9ae1267d87a1bb9effa9072a53ec9f952803b3c2e61a1fd9f88a4a98c1b4a18"
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
