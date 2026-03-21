class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.38.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.00/gam-7.38.00-macos26.3-arm64.tar.xz"
      sha256 "ff19abeb3f25fb6f0a0b7de98352f3bf6f7d6e33ffdf4edab624edcc6de82e9e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.00/gam-7.38.00-macos26.3-x86_64.tar.xz"
      sha256 "d2f180d99ffc1ca2f144b8519f6b7bcee0ad55d86eec0acd576c731befbc3ae1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.00/gam-7.38.00-linux-arm64-legacy.tar.xz"
      sha256 "a866658ff01721551713788f5d564c85e58a4b2008123b5fddbbeee82c5fae5b"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.00/gam-7.38.00-linux-x86_64-legacy.tar.xz"
      sha256 "f31cac7ba1b1502555185708a46eaa72742047fcd95a716ab34d2deee433f50a"
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
