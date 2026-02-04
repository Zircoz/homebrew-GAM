class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.33.00"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.00/gam-7.33.00-macos26.2-arm64.tar.xz"
      sha256 "ac047a929377d29a25e94fe7043e2bebe5e080fe1c6bb7a7e18646e9aa7b33ce"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.00/gam-7.33.00-macos15.7-x86_64.tar.xz"
      sha256 "10047c69c7747aaed1751e8370cb0669e51a62d4b53ed0e11d2ded40f64c5263"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.00/gam-7.33.00-linux-arm64-legacy.tar.xz"
      sha256 "7e760fcfe5203dd734542dae9bd3c1dcdbd41e4bf5ce5f14dbd490726bff8095"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.00/gam-7.33.00-linux-x86_64-legacy.tar.xz"
      sha256 "9ad688dcd45f491c07eac3a723d089b0c6b3dcf1034a8b067be6be38feac4ec9"
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
