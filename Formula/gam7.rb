class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.17"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.17/gam-7.48.17-macos26.6-arm64.tar.xz"
      sha256 "ff8e62dc34e51525c6c6e0429fca6899c282460265503ffd8e7dfbd4fd5449f5"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.17/gam-7.48.17-macos26.6-x86_64.tar.xz"
      sha256 "f32120128b167978bd91de16345290da4ecb5cb0885612cbef1976da750c3304"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.17/gam-7.48.17-linux-arm64-legacy.tar.xz"
      sha256 "420c11703d1dc488289daa59157b4e67b19816101b42da6b83f40e36193ba565"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.17/gam-7.48.17-linux-x86_64-legacy.tar.xz"
      sha256 "322a1edbcb09d781268a747180229b01522bda790810ffc6756bf9363acd2a23"
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
