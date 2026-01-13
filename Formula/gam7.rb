class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.05"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.05/gam-7.31.05-macos26.0-arm64.tar.xz"
      sha256 "ca39aa464c320fcb80b3981fc69740390e3821667affa912f335b3c39b05c176"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.05/gam-7.31.05-macos15.7-x86_64.tar.xz"
      sha256 "15fe5b4dbc57735015e7de7787dae079ef223a6189b41602ce52bc7ec20c8a00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.05/gam-7.31.05-linux-arm64-legacy.tar.xz"
      sha256 "bb7fe0ed69d987b195595aa81decc7cefcd0bea7cc76db8bce7f8526b697fcf2"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.05/gam-7.31.05-linux-x86_64-legacy.tar.xz"
      sha256 "9f67db8f4aa063aa99c502d8a2453190e312e4a9ba943d0ee7b8db5d602e8480"
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
