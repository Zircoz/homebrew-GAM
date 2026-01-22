class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.32.02"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.02/gam-7.32.02-macos26.0-arm64.tar.xz"
      sha256 "c0c48f68e4e77680b689717c27b88c43ac7e954ef7d036c944919ebd5cb95259"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.02/gam-7.32.02-macos15.7-x86_64.tar.xz"
      sha256 "5f70ad88ef0fda56c594100070cb7be63dd22cd5847f641e5023f9931547efbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.02/gam-7.32.02-linux-arm64-legacy.tar.xz"
      sha256 "54d94218df4b714d79b077fab24a6d76da5b6945f97ca0450c428f76cd1be083"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.32.02/gam-7.32.02-linux-x86_64-legacy.tar.xz"
      sha256 "03d0f62729a4769c7e21115429e9536bf066991005b416a08bbecb2b8b2c0db8"
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
