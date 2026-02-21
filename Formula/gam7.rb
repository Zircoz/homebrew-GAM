class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.06"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.06/gam-7.34.06-macos26.3-arm64.tar.xz"
      sha256 "ec10e47316ccab3c33e8174683385a79f7ca45062218d4c1568ec71482fbac50"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.06/gam-7.34.06-macos15.7-x86_64.tar.xz"
      sha256 "0f3af19a40ae747ff733bcb2534a3a4c9e4b055df81e2eb1362796e0514a7575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.06/gam-7.34.06-linux-arm64-legacy.tar.xz"
      sha256 "4f1fce0006e94bd7b7c13658a83312fa526d528f57fa658f07c535d3fa33fed2"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.06/gam-7.34.06-linux-x86_64-legacy.tar.xz"
      sha256 "2bc3eb8c103354656b9062d59249cb919c22518276fbcbdff6999272e2134326"
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
