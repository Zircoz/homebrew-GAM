class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.04/gam-7.47.04-macos26.5-arm64.tar.xz"
      sha256 "673c8876e456cd0280c259be68d123b486e4b2c50c784eead3356fcbf00fcd3a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.04/gam-7.47.04-macos26.6-x86_64.tar.xz"
      sha256 "86c19585b9842ef7b6a4dadf77649d6376f487a31033190665246ef8128059c4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.04/gam-7.47.04-linux-arm64-legacy.tar.xz"
      sha256 "f5f5d8255a83b5e6cdef260bc073377b30883454e181e81a0260b9c3d9733189"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.04/gam-7.47.04-linux-x86_64-legacy.tar.xz"
      sha256 "85f3ef5121e73e8bca61410366f288da1b1da08a5a9a974936d56c1c6dfaefd6"
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
