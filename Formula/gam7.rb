class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.09"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.09/gam-7.34.09-macos26.3-arm64.tar.xz"
      sha256 "c56458d9466de3ff3654c8d11e80fd8a4aced1c0beacbfbb6555c6539bc8815d"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.09/gam-7.34.09-macos15.7-x86_64.tar.xz"
      sha256 "8744885c157a0cf31f9fefdb8688a8f27083259e19c4ef9531e67a0ae1bc5970"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.09/gam-7.34.09-linux-arm64-legacy.tar.xz"
      sha256 "7ee476943a28ef8b4c67e88ad37fb1241dab1dd087d720510db09fca128bc6a2"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.09/gam-7.34.09-linux-x86_64-legacy.tar.xz"
      sha256 "471acdf6506de0532575732b903c8d04ae2d756cb678073d20d0ded0e5ecfcfb"
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
