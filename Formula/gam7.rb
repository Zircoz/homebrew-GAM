class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.07"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.07/gam-7.43.07-macos26.3-arm64.tar.xz"
      sha256 "4ccec3dd6520de1e9d90c12a99b8630ed6dbede9b8828d0d3b46547cea33e897"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.07/gam-7.43.07-macos26.3-x86_64.tar.xz"
      sha256 "e64d8ef59a66ee965a2024a5ee4362e83ce91c36ed8c550958ec98634cbaa618"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.07/gam-7.43.07-linux-arm64-legacy.tar.xz"
      sha256 "65c12be29e6d1a5915387b0edb5d12da269dbdc7fff849d736db8ac5d370a9be"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.07/gam-7.43.07-linux-x86_64-legacy.tar.xz"
      sha256 "75d013132604fa39df4e33feeb404c10d89e0ea1ec403976108b49c1bc1c0dd6"
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
