class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.07"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.07/gam-7.47.07-macos26.5-arm64.tar.xz"
      sha256 "2ad5479555580c3406191a9b3ac0c52cf9775a7aeee576814854449573c149ab"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.07/gam-7.47.07-macos26.6-x86_64.tar.xz"
      sha256 "5c731678850a6ae3e43747d080f464d816e877c4cd81cdd8a8e13f9bb5e7e335"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.07/gam-7.47.07-linux-arm64-legacy.tar.xz"
      sha256 "2c53121f5443b2f8f7e0744a4603d4232cc55d24ade1782ea947856ae5ab76aa"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.07/gam-7.47.07-linux-x86_64-legacy.tar.xz"
      sha256 "69d844a2027a822c6dd61c35201665c661a0f3cfaf8572da022e3b2c1dba79a5"
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
