class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.09"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.09/gam-7.48.09-macos26.6-arm64.tar.xz"
      sha256 "473d428ff653e9219382085314635ed90fadc82fda9be0a3084538de72111b7f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.09/gam-7.48.09-macos26.6-x86_64.tar.xz"
      sha256 "dcfcc6ca69232144a581856377d7da71a6c675bdc8a7b9d6fbf949a4cc7d10d0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.09/gam-7.48.09-linux-arm64-legacy.tar.xz"
      sha256 "0502f79f93f3b43f2ae34ac3d1664b9f27839a27b62d3c8348dffc5301089937"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.09/gam-7.48.09-linux-x86_64-legacy.tar.xz"
      sha256 "7db03c37a16e87a2d1f9e352338fb4ee3a5a6aa3e00ce6514008e252d32d34eb"
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
