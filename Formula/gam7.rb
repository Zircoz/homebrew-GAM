class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.13"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.13/gam-7.34.13-macos26.3-arm64.tar.xz"
      sha256 "1389e27c6347c0da65cd2b198fb4c9fbd391b7061ab51c73c6b6c9bf02fc5cdb"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.13/gam-7.34.13-macos26.3-x86_64.tar.xz"
      sha256 "b07d8ff64f73d206548c90cd2fe9afafd040854dca905f5848940aa83dd6193d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.13/gam-7.34.13-linux-arm64-legacy.tar.xz"
      sha256 "0e1ff5fbac1a876eed374c3205411b0e2e578b7999c0421daa7488336c8d616e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.13/gam-7.34.13-linux-x86_64-legacy.tar.xz"
      sha256 "22192bc6588a0bf98a2bd81436bcb15f66fe812c51dc38baeca83c71f45521dc"
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
