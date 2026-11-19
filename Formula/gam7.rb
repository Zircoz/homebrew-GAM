class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.04/gam-7.52.04-macos27.0-arm64.tar.xz"
      sha256 "9bd770a9c00677b7a03fbde84110cdd14f5da7d7a4b2a0e2c7be43d76ace3f71"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.04/gam-7.52.04-macos26.6-x86_64.tar.xz"
      sha256 "9488d8ed85d0542fe551ca46071bf49e12bd8f2648088ecae2b9ede27bf19524"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.04/gam-7.52.04-linux-arm64-legacy.tar.xz"
      sha256 "88260f8f69c2e707e54d620aa94fcb39d17b246aedf6a92605700153b294d232"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.04/gam-7.52.04-linux-x86_64-legacy.tar.xz"
      sha256 "f0fe00219051c7587e0f985cf82be872b9a6ebdcfe1c7c84bbfa37224c49f966"
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
