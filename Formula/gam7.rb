class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.02"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.02/gam-7.34.02-macos26.2-arm64.tar.xz"
      sha256 "c09d560d019f3e733c922ee92dd9ae35371d21ed599f839d5b782391ed990c68"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.02/gam-7.34.02-macos15.7-x86_64.tar.xz"
      sha256 "c0e6b5e272c8f1909c1c9daf0c3ce7a7de0dcef46a3398112f22411b56102770"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.02/gam-7.34.02-linux-arm64-legacy.tar.xz"
      sha256 "117432fe8e53e569b9c358c388298d3c96aa2fc44cdcf8a45cdb67248e6b9199"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.02/gam-7.34.02-linux-x86_64-legacy.tar.xz"
      sha256 "9548f92bf6d3d141deb31fde5047b82f8be22eb8976014f5459b612137517a2c"
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
