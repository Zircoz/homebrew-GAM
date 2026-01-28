class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.04"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.04/gam-7.32.04-macos26.0-arm64.tar.xz"
      sha256 "142ab1c623fe0d29cf31c1f9fc02089e0db4e6e5745f746a2994402502f254b9"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.04/gam-7.32.04-macos15.7-x86_64.tar.xz"
      sha256 "99579acd9b0ea5a99be60e1367f077d7c5180f6880477ccc1be61c23f64da88c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.04/gam-7.32.04-linux-arm64-legacy.tar.xz"
      sha256 "05e8705acec4e79b71ab80bbabb54bfbc0f08d551e3bcf6ca940c4091f9a5c64"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.04/gam-7.32.04-linux-x86_64-legacy.tar.xz"
      sha256 "cba2076bcadc2d62e43dc1d99ed0e4c8c4c79a97c268b959f8cb84ddb90b0117"
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
