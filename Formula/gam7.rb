class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.10"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.10/gam-7.34.10-macos26.3-arm64.tar.xz"
      sha256 "1dcc321fa2c620de3c5712404ae7a7ba923c155f7d66ebb6a5adc1ed353cefd5"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.10/gam-7.34.10-macos26.3-x86_64.tar.xz"
      sha256 "983cf3e841006014189fef65c6f9abeade3c6df168ca1608f583ac4767c81117"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.10/gam-7.34.10-linux-arm64-legacy.tar.xz"
      sha256 "975c78f57b83111794749906369116238ecbe5a2aa203cdc66bf16feda4d174b"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.10/gam-7.34.10-linux-x86_64-legacy.tar.xz"
      sha256 "d5ac92d9e48c3df3b709e0b8483d76d9bd1584e1963cd7c42efc22fb9e5ca4e1"
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
