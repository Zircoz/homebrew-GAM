class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.07"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.07/gam-7.39.07-macos26.3-arm64.tar.xz"
      sha256 "297c1441e183e0156dba8e1c64c6db54f755c926b787d6db15a95132c9e6619c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.07/gam-7.39.07-macos26.3-x86_64.tar.xz"
      sha256 "22f2146055d1d6e4edec80f34875405b70e9690488bc3c4a67462eee39131759"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.07/gam-7.39.07-linux-arm64-legacy.tar.xz"
      sha256 "1b13f495a0ccd05f40d218605788dabe941c3d5d61d9d150165bb1401de79bc7"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.07/gam-7.39.07-linux-x86_64-legacy.tar.xz"
      sha256 "6fb92e254d1b73a4ef91960736500953be0912f4246e2677b9459f0be2f3c548"
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
