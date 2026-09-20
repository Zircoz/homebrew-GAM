class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.11/gam-7.48.11-macos26.6-arm64.tar.xz"
      sha256 "0fbde4af696d68512a6bddb24bf5a3c32875a9d6510964e10b9bb61ec2e49f9c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.11/gam-7.48.11-macos26.6-x86_64.tar.xz"
      sha256 "0c6a0e943981a40c8e6cc34cedb2651e380d381c83133bb6993d37215b3bea34"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.11/gam-7.48.11-linux-arm64-legacy.tar.xz"
      sha256 "3c9d6f8a4ed5ee2fed8ec12add473bba40847826451c95ebcfb1c9e377c06c73"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.11/gam-7.48.11-linux-x86_64-legacy.tar.xz"
      sha256 "3caa6fb8008c8b19f727de6300a95553733fca21fef9c4b55b5d472580a8ce6b"
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
