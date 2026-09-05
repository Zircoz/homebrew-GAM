class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.05/gam-7.48.05-macos26.6-arm64.tar.xz"
      sha256 "16978a8610d6f56dffde361e35268c01b643c2c9498655240056fdc3ea3a590a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.05/gam-7.48.05-macos26.6-x86_64.tar.xz"
      sha256 "f8af7e72414100119eb1934d1e35980b54a503f6bc1f598668755ad64ddf0a4a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.05/gam-7.48.05-linux-arm64-legacy.tar.xz"
      sha256 "a10120c07595294c2dff9415dececf935912d51d0ca034d6426e8c4f8ca052b6"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.05/gam-7.48.05-linux-x86_64-legacy.tar.xz"
      sha256 "b84c43f31a9bf1c8f7a8b7a6b28280e1561e4c32ebe2fdf12e8656f3ec0ebf72"
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
