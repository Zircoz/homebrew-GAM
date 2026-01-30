class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.06"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.06/gam-7.32.06-macos26.2-arm64.tar.xz"
      sha256 "3e9a65ff1cb1230baa44a04fe0f6aed293882839f16e7f4641d9bd0302988fab"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.06/gam-7.32.06-macos15.7-x86_64.tar.xz"
      sha256 "a9e9f6a142b1add2da93d2617548b7bea353c03a5a2ba528cbb8bcadbc9e697d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.06/gam-7.32.06-linux-arm64-legacy.tar.xz"
      sha256 "7f2faf378dca68c8692d497f5a3f94183c3ec66887ae71cfe840e7b1f0f08345"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.06/gam-7.32.06-linux-x86_64-legacy.tar.xz"
      sha256 "78531a71cb47fa7da5b9a47d1016f4897b3c8610231eb41fede89c32aa985fcc"
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
