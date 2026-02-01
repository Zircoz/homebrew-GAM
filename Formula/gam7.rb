class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.07"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.07/gam-7.32.07-macos26.2-arm64.tar.xz"
      sha256 "e713dad82e61d2463385b2059702accc1a32d981118ea1407fd658f25cd913c3"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.07/gam-7.32.07-macos15.7-x86_64.tar.xz"
      sha256 "10f55026715d3811887282c244fa8315cac258ea5e579f552e1d74d43addaeb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.07/gam-7.32.07-linux-arm64-legacy.tar.xz"
      sha256 "a23ff366b34489684cab8fff6bae3fb9a83b700f16b84ad3c22b462673faf707"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.07/gam-7.32.07-linux-x86_64-legacy.tar.xz"
      sha256 "52e64239409c3dd660b27c2f1dc860ce314cf4a9e78a2a928fb72f0557f39c5c"
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
