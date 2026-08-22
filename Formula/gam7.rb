class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.00/gam-7.48.00-macos26.5-arm64.tar.xz"
      sha256 "9ec8778579675400e5892285580cc683f9eff606100524d5046f719d45075ef9"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.00/gam-7.48.00-macos26.6-x86_64.tar.xz"
      sha256 "a051aaa5f81909a566faa023bbeda254959dc7a4be58cdf6d9abf7766d340823"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.00/gam-7.48.00-linux-arm64-legacy.tar.xz"
      sha256 "d9ba3ddf58aa9eae04e3433267c7b28d892b437abe4900a2960e9c7e73e1063d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.00/gam-7.48.00-linux-x86_64-legacy.tar.xz"
      sha256 "46b7d2e287ac594b1914c94cb5e52eee5ce768d5bb90e9eb403034b3a235ea46"
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
