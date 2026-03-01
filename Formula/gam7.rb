class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.11"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.11/gam-7.34.11-macos26.3-arm64.tar.xz"
      sha256 "3d18e3f3604113ebaeca98fe2871c345ca60e477e615e6ed3b903e59cfdc91d1"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.11/gam-7.34.11-macos26.3-x86_64.tar.xz"
      sha256 "794989ad47bb4509e0b62df6e310edb02562a5f1b0bf090594e75e725d6cfc65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.11/gam-7.34.11-linux-arm64-legacy.tar.xz"
      sha256 "7c3c56c8005bf392ce1dd6d64d61887074e7d1b458b99b6528a918047ea8b06f"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.11/gam-7.34.11-linux-x86_64-legacy.tar.xz"
      sha256 "753f7db6b54c03d0f9bfd38afb6fe652f36a058c3c65a4e919b37eafce95d9d3"
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
