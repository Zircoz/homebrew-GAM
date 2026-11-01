class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.50.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.50.00/gam-7.50.00-macos26.6-arm64.tar.xz"
      sha256 "b39b5af2d1d3b0b92db29f9ca3783f3e35fc1123ffcae01c8be563548acb2a27"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.50.00/gam-7.50.00-macos26.6-x86_64.tar.xz"
      sha256 "54cef01113c89bb86dea85c48bd70220cdba5123e13bfbe2932b649efd8b7ae2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.50.00/gam-7.50.00-linux-arm64-legacy.tar.xz"
      sha256 "f9aaad73b6dce8c995c2c9b7bea06d55b97e37a191fae519729341be4f4f6441"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.50.00/gam-7.50.00-linux-x86_64-legacy.tar.xz"
      sha256 "04655ab74a9410aefb0ee62cf7456373591326db1b8b45ee59af51ff11ca98df"
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
