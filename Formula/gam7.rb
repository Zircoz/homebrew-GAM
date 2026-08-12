class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.05/gam-7.47.05-macos26.5-arm64.tar.xz"
      sha256 "06f16210b4c820730dc21648e0ab9047f4bdb7cc9ca56a1dfda31bb44b5d433c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.05/gam-7.47.05-macos26.6-x86_64.tar.xz"
      sha256 "17e0416166728b23477d5a0885de29dbdbd0cce41348aea133e76e3393d88607"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.05/gam-7.47.05-linux-arm64-legacy.tar.xz"
      sha256 "0b0f8a03a023b9567926ec89cc775a2a1daf69602d4724f442002fdbd98a170c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.05/gam-7.47.05-linux-x86_64-legacy.tar.xz"
      sha256 "e2c9c541ea7e1c3e4615e4b71452c6c519fa82475ba622e606a962a65342022e"
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
