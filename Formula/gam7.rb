class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.04/gam-7.39.04-macos26.3-arm64.tar.xz"
      sha256 "7344aa52942e34e38947fd87529491186f02ba873d91d28eaf55cb54e3aa9767"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.04/gam-7.39.04-macos26.3-x86_64.tar.xz"
      sha256 "27a05238e0b756028ab16bf180b4d9e6b8f326c2a6ffe6f178ee944c944c772c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.04/gam-7.39.04-linux-arm64-legacy.tar.xz"
      sha256 "87e14f94dd8857c70225748ae1f4316eeee0969adad00b7a763997ab202e7025"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.04/gam-7.39.04-linux-x86_64-legacy.tar.xz"
      sha256 "9f5edda1219318a8e8c6fa4c3e4882a9d38f17b6d5320035d09fc06fcc81e9c0"
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
