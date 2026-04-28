class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.42.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.42.00/gam-7.42.00-macos26.3-arm64.tar.xz"
      sha256 "193dddf54709ea6bd4cb7bbf2748c5e9f1be19a8867941745f97d1cedac5a4c0"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.42.00/gam-7.42.00-macos26.3-x86_64.tar.xz"
      sha256 "0de898cb9fca32e1f40ca74f36cc21d3f5d46ac1d757a8ae7d1dd7267d183fe1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.42.00/gam-7.42.00-linux-arm64-legacy.tar.xz"
      sha256 "9bbdadf8c839f05295cd39236a3441a70af19dc2759ba543c5b8aa62a5a129b3"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.42.00/gam-7.42.00-linux-x86_64-legacy.tar.xz"
      sha256 "bb912086c49f9421b24ee885263b4361327716ed4c9e049512a5022e5a63d6a8"
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
