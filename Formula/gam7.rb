class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.01/gam-7.47.01-macos26.4-arm64.tar.xz"
      sha256 "8b984b358b05593032892389f08bf26a1aaf7eff5058ff1bae43cb431873ee65"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.01/gam-7.47.01-macos26.4-x86_64.tar.xz"
      sha256 "f413597e3a27352ba978734b0b6115ac3753a2a97eed10ebdcc8364783373d05"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.01/gam-7.47.01-linux-arm64-legacy.tar.xz"
      sha256 "d738661a3b44c5af1de335feb983ebf63a997c9f12fcd90ad241401f51a2803d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.01/gam-7.47.01-linux-x86_64-legacy.tar.xz"
      sha256 "767c20829e8d1860c899df960dae74bb6049151a06a3d5a1a1de54f5a55865f7"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gam"
  end

  test do
    system bin/"gam", "version"
  end
end
