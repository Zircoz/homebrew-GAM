class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.05/gam-7.43.05-macos26.3-arm64.tar.xz"
      sha256 "13dd79e0b71d1c7f5d8a0ce21690edc90cec0a883723db16b11e88da4184aa1c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.05/gam-7.43.05-macos26.3-x86_64.tar.xz"
      sha256 "a89507e15ca42004066b5996c9b32933bf891b7d81359791363145c49f6f4672"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.05/gam-7.43.05-linux-arm64-legacy.tar.xz"
      sha256 "fc42f4e8b2de583e50129529abbdd2fba1dc71a5b80952bde34221b83f6a4a38"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.05/gam-7.43.05-linux-x86_64-legacy.tar.xz"
      sha256 "0e8bf8b0251d4088b7e3819c251747a7eccecf8f7c116e26fa41372dfcbb87ed"
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
