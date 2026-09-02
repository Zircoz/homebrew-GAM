class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.02/gam-7.48.02-macos26.5-arm64.tar.xz"
      sha256 "a0bca14464b5244d36dbaed162f7194d09d5be4564f5beed841d97cb3893c46f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.02/gam-7.48.02-macos26.6-x86_64.tar.xz"
      sha256 "98921beed8051b5da98a4c4399d8370b95c11b172ec5d1da91461001acf35f00"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.02/gam-7.48.02-linux-arm64-legacy.tar.xz"
      sha256 "15ae5ce92618f46dc9fd5fb70765c5711bc30fb92dc5d77eae94b338daf46420"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.02/gam-7.48.02-linux-x86_64-legacy.tar.xz"
      sha256 "3f9f1b67b579b23dfb6bce80771ed001964fe3ec9fa8aa15c759c37548f3af6a"
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
