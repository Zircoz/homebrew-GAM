class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.01/gam-7.39.01-macos26.3-arm64.tar.xz"
      sha256 "ca65640edd89bd8bf9dd4bd1c7e150b40c09ce8fb2f3dbfe8d897b7fbca341d0"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.01/gam-7.39.01-macos26.3-x86_64.tar.xz"
      sha256 "35658d3c94d162620a6147a57e1619aa37d05b557fbd8082861ffc0d7215fa7f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.01/gam-7.39.01-linux-arm64-legacy.tar.xz"
      sha256 "d50492663ff9228d9e06c66041a80bfbd65a12e60fb00cc04638d84b5944a17b"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.01/gam-7.39.01-linux-x86_64-legacy.tar.xz"
      sha256 "088326e7a43cdb9959dd61ac1331bfb35c2f2a9d342125ab12d7f6642c0ed43e"
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
