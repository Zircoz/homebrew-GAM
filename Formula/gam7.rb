class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.00/gam-7.39.00-macos26.3-arm64.tar.xz"
      sha256 "2eda1a75d00f51d783017f156b3f390e305819d756bcd8f1a29466d2aeb72537"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.00/gam-7.39.00-macos26.3-x86_64.tar.xz"
      sha256 "f5cc5bc895b4bfd838c2e125466c5185daec3c6b499b8209aed607d087d177a4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.00/gam-7.39.00-linux-arm64-legacy.tar.xz"
      sha256 "e6a4de741d8f19420fa00971afeff876d515d9cbbc9bef904dcd5b8c3edb9ac2"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.00/gam-7.39.00-linux-x86_64-legacy.tar.xz"
      sha256 "020caf9349c6998703cde569e6621fe7f07bea567cbcf1e2851fa28130ee947c"
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
