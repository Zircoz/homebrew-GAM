class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.40.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.00/gam-7.40.00-macos26.3-arm64.tar.xz"
      sha256 "86ee701f00f814886b26b938c9d89021bc4b8beebafd655559ea7965bb02d873"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.00/gam-7.40.00-macos26.3-x86_64.tar.xz"
      sha256 "95d1b71f03a9737c6d2f23111224804a700f3fca3383ac96936580ed9e9a785b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.00/gam-7.40.00-linux-arm64-legacy.tar.xz"
      sha256 "95b1bc8e0ec7349988195e24cd2fa83c1020202e8a00a3d8f52b8834cabf97d9"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.00/gam-7.40.00-linux-x86_64-legacy.tar.xz"
      sha256 "bbd4e204640199209cb0e85e7139db0c9e5686b6225ed705f05e429ee69df6ee"
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
