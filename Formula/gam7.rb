class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.26"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.26/gam-7.48.26-macos26.6-arm64.tar.xz"
      sha256 "e51831498b0a520d324434813357468a39855f374d5821a659715a07469aa6af"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.26/gam-7.48.26-macos26.6-x86_64.tar.xz"
      sha256 "afa43bf417803701b6b43dae76f5c19da96dc814073f03548a7a7103da3e06a7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.26/gam-7.48.26-linux-arm64-legacy.tar.xz"
      sha256 "6c0d40ef6fa2356646593ace8ccdc4ba11fb6d20621aeef0e73c1deb553a3bdf"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.26/gam-7.48.26-linux-x86_64-legacy.tar.xz"
      sha256 "149c7b5d2342ea3284cda15a6fbedf45301bcf76a0f91a7d0f3ecfb0621cdabe"
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
