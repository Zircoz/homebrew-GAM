class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.37.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.37.00/gam-7.37.00-macos26.3-arm64.tar.xz"
      sha256 "7bf47bed011189066fab206b6da58e44a2817213cfc100878df66a87f0007904"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.37.00/gam-7.37.00-macos26.3-x86_64.tar.xz"
      sha256 "929bed793f44fb0c290e32bf9174f1f25a9a8ae449c76d2f3c79dbf7e09bf618"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.37.00/gam-7.37.00-linux-arm64-legacy.tar.xz"
      sha256 "c2d781b180328c2be10d8d00ba1bf442ae189a037788fd3d9d720700437bf411"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.37.00/gam-7.37.00-linux-x86_64-legacy.tar.xz"
      sha256 "8c46f8ba204fc2184efdc8e4a80a561db040e2d39658e63a6d84361e5e38c328"
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
