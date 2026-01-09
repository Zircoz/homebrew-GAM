class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.03"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.03/gam-7.31.03-macos26.0-arm64.tar.xz"
      sha256 "1e075900ad0b897c08c41321db78321d2f0ecb1dc2a2ffe32b39ae66001ac90f"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.03/gam-7.31.03-macos15.7-x86_64.tar.xz"
      sha256 "078aca9749685924adf394859ac59b1c2b81d971657a632b3703967d9d5859a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.03/gam-7.31.03-linux-arm64-legacy.tar.xz"
      sha256 "1fbb66898b4b0e30ba6c546331d6910269e898cccae492e6059817b929f3d9e1"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.03/gam-7.31.03-linux-x86_64-legacy.tar.xz"
      sha256 "ddc1f91fe7523bf1f7f9b90022279754803c80692249a9a8c289604ca1d3ab9c"
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
