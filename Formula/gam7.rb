class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.05"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.05/gam-7.34.05-macos26.2-arm64.tar.xz"
      sha256 "7aea9b5035fa676cafed7bcc47c444079b68b13a1b89898c7991923300733682"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.05/gam-7.34.05-macos15.7-x86_64.tar.xz"
      sha256 "ee2766ac59519ef44ad41cc046ba32b2c7a84a8fd2b2f57d0156001d050d38fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.05/gam-7.34.05-linux-arm64-legacy.tar.xz"
      sha256 "62e6580eabf4216219936e2ac7ac1f04ecc16f28c4811aa571251820a7c12402"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.05/gam-7.34.05-linux-x86_64-legacy.tar.xz"
      sha256 "64d7d9d73c3c7c3d0a8590290c8d7b393bcbb04d6132e59a0e9846a06f2c2245"
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
