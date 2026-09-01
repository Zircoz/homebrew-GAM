class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.03/gam-7.48.03-macos26.5-arm64.tar.xz"
      sha256 "5b08331e68263a997e231c0b61e11ee57be26fa27d913fda97c4e08dd5061449"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.03/gam-7.48.03-macos26.6-x86_64.tar.xz"
      sha256 "1cb57107698b7d10e8deed9319b7c066d920065c0c70705eddf64fcf418c8fcb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.03/gam-7.48.03-linux-arm64-legacy.tar.xz"
      sha256 "4bee7ce9bfbd836a80fcdb301730cd0555c129dd82210b8de8b1ef5d1452133d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.03/gam-7.48.03-linux-x86_64-legacy.tar.xz"
      sha256 "116adb4c538e250d1f571bc4bfa0b076846c71b04a71c117be9c1c26c31ae09b"
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
