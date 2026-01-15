class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.06"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.06/gam-7.31.06-macos26.0-arm64.tar.xz"
      sha256 "e2faaa1e91bb408b7a358396d4a76e1bdfc20486e73b54c4702e846be0b5fb3e"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.06/gam-7.31.06-macos15.7-x86_64.tar.xz"
      sha256 "ea77575c1a9b06f486d2fd86f7747f8bb9e30195f1943c2b11dad708aca91acb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.06/gam-7.31.06-linux-arm64-legacy.tar.xz"
      sha256 "b4cbf0fcfb85adc3b4749c44d1dcdf56c5fdec900a3f55df1a0350cc986125b5"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.06/gam-7.31.06-linux-x86_64-legacy.tar.xz"
      sha256 "c03192b5b837ca760db0a2595751efa81856a8db404e2804f256db734864f73b"
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
