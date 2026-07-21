class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.11/gam-7.46.11-macos26.4-arm64.tar.xz"
      sha256 "8ff345e53ceda76145f50b9810d07aac5f509dd30471de6d5cd9e44997225394"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.11/gam-7.46.11-macos26.4-x86_64.tar.xz"
      sha256 "115c04b93a2c47a10387d9d7d6c9d167d30cd1d6941b287e9aa23bc58b97689a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.11/gam-7.46.11-linux-arm64-legacy.tar.xz"
      sha256 "4b8c4317c8b08252a6c1381ed56613b5db36806b26f86645ab4525112bf8ce6c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.11/gam-7.46.11-linux-x86_64-legacy.tar.xz"
      sha256 "5016a8e15a2bfe77c0c706e954ba0b3ed1b10f751c9e1c2c3d0c0a2b648886f2"
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
