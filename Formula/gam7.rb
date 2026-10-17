class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.30"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.30/gam-7.48.30-macos26.6-arm64.tar.xz"
      sha256 "67fbad3d2343cddb5da7a8084c3f03b2c8d6786e8319ffdb6d692dbdefbd94cf"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.30/gam-7.48.30-macos26.6-x86_64.tar.xz"
      sha256 "86eabef9cde5194f160cc9d9599a7964f2f090a91f18ad02c554f1c7517ccd41"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.30/gam-7.48.30-linux-arm64-legacy.tar.xz"
      sha256 "356b69c41a99e352e4eb2de66bab462c8893478f3e08c68a5562a2f60cafb0bf"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.30/gam-7.48.30-linux-x86_64-legacy.tar.xz"
      sha256 "2c52a8b3e121b1393896ba7b7182af0debc6ffbb650153a8d698dccfd0e26e2b"
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
