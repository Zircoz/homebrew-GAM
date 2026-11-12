class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.01/gam-7.52.01-macos27.0-arm64.tar.xz"
      sha256 "d7528d7af11d72f8728aedd50e85c124c3e028c32c8a3135793a59ab71be6b9f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.01/gam-7.52.01-macos26.6-x86_64.tar.xz"
      sha256 "68266a8006748f5b7f2dfd5cf518d35f51af453639efd5d35ce28e52272eb1ea"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.01/gam-7.52.01-linux-arm64-legacy.tar.xz"
      sha256 "70d1642447edebfbf18430a05063dce29c2e392bd4e5976962b4d69fad35820a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.01/gam-7.52.01-linux-x86_64-legacy.tar.xz"
      sha256 "71509a4c56a8a267274fe86f274c245056db9ca13d3582c2bbca3d72d4560762"
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
