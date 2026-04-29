class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.01/gam-7.43.01-macos26.3-arm64.tar.xz"
      sha256 "8134cc05fcaaf9b018f2d53a56b5605a05b13c3cf2ead8afea35f861e0ee71ae"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.01/gam-7.43.01-macos26.3-x86_64.tar.xz"
      sha256 "7d61aa6d7f8b8bc3366b5aed5e41b7010a9c032bf25f9a75e2b06f132b76c8c7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.01/gam-7.43.01-linux-arm64-legacy.tar.xz"
      sha256 "a2c8825f6054ef80dc86ae282daf1988cfa197aef85e42a2e0bf3a4372084906"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.01/gam-7.43.01-linux-x86_64-legacy.tar.xz"
      sha256 "9c4607d6da1550d1841781cc89d761f78197437cedd1421d110eed04d811514f"
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
