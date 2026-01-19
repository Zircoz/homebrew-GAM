class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.01"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.01/gam-7.32.01-macos26.0-arm64.tar.xz"
      sha256 "97b4f2ac53f9ea12c3dee1ecba851cf6051cb04e4e204da511a914032df93750"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.01/gam-7.32.01-macos15.7-x86_64.tar.xz"
      sha256 "9bf40fb77a8b71ca1769e712d0efeef0b59df47ac0882a509a30dbb23a7ba2f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.01/gam-7.32.01-linux-arm64-legacy.tar.xz"
      sha256 "754f7e158e966dade69113ac333821f2aa67a78542ac6e82929c512508fae43b"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.01/gam-7.32.01-linux-x86_64-legacy.tar.xz"
      sha256 "0f6cb14022d11f1086fafa0726845f66d7b896d62a8890fa1938bfeca8cd2de2"
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
